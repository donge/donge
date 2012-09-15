<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}

//====== CLASS DBConn ========================================
// DB ConnectionWrapper for Access2000 DB
//
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-02-26 23:57:15
//============================================================

function DBConn(strDBPath){
  ////// Attributes /////////////////////////////////////////////
  
  // Private
  var dbConnection = Server.CreateObject("ADODB.Connection");
  
  // Public
  this.connString = strDBPath;
  try{
    this.dbPath=Server.MapPath(this.connString);
  }catch(e){
    errorMessage("DB Path does not exist.");
  }
  this.opened = false;
  this.recordCount = 0;
  this.returnRecordCount = 0;
  this.queryCount = 0;
  // Debug
  this.debugData=new Array();
  
  ////// Methods ////////////////////////////////////////////////

  // Open DB Connection ----------------------------
  this.open = function(){
    if(!this.opened){
      try{
        dbConnection.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+this.dbPath;
        dbConnection.Open();
      }catch(e){
        errorMessage("DB Connection failure.");
      }
      this.opened = true;
    }
  }
  
  // Close DB Connection ----------------------------
  this.close = function(){
    if(this.opened){
      try{
        dbConnection.Close();
      }catch(e){
        errorMessage(e);
      }
      this.opened = false;
    }
  }
  
  // DB Query ----------------------------------
  // intPageSize & intCurrentPage is optional
  this.query = function(strSQL, intPageSize, intCurrentPage, bRawArray){
    // Check If the Connection is opened
    if(!this.opened){
      this.open();
    }

    this.queryCount++;

    // Query
    var tmpRS = Server.CreateObject("ADODB.Recordset");
    try{
      if(intPageSize!=undefined){
        tmpRS.Open(strSQL, dbConnection, 1, 1);
      }else{
        // Use Simple Execute if no Page is used
        tmpRS=dbConnection.Execute(strSQL);
      }
    }catch(e){
      if(inDebug){this.debugData.push([strSQL, "x", "x"]);}
      errorMessage(e);
    }
    // Process Result
    var result=new Array();
    if(tmpRS.bof && tmpRS.eof){
      this.recordCount = 0;
      this.returnRecordCount = 0;
      // Debug
      if(inDebug){this.debugData.push([strSQL, 0, 0]);}
      return null;
    }else{
      if(intPageSize!=undefined){
        tmpRS.PageSize=intPageSize;
      }else{
        intPageSize=tmpRS.RecordCount;
      }
      if(intCurrentPage!=undefined){
        if(intCurrentPage<=tmpRS.PageCount){
          tmpRS.AbsolutePage=intCurrentPage;
        }else{
          return null;
        }
      }
      result=tmpRS.GetRows(intPageSize);
      // Set Record Count for reference
      this.recordCount = tmpRS.RecordCount;
      this.returnRecordCount = result.ubound(2)+1;
      // Debug
      if(inDebug){this.debugData.push([strSQL, this.returnRecordCount, this.recordCount]);}
      // Transform Array Demisions
      if(!bRawArray){
        result=transformArray(result,tmpRS.Fields);
      }
      tmpRS.Close();
      delete tmpRS;

      return result;
    }
  }

  // Private - RS Array Transformation Helper Function ---------------------
  // I don't like the default style of the return array of GetRows
  function transformArray(arr,labels){
    var outputArray=new Array();
    var rows=arr.ubound(2);
    var cols=arr.ubound(1);
    for(var i=0;i<=rows;i++){
      outputArray[i]=new Array();
      for(var j=0;j<=cols;j++){
        outputArray[i][labels(j).Name.toLowerCase()]=arr.getItem(j,i);
      }
    }
    return outputArray;
  }

  // DB Update ----------------------------------
  this.update = function(strTable, arrValue, strWhere){
    // Construct SQL string
    var strSQL="UPDATE "+strTable+" SET ";
    for(i in arrValue){
      if(arrValue[i]!=undefined){
        strSQL += " " + i + "=";
        switch(arrValue[i].constructor){
          case Boolean:
            strSQL +=arrValue[i]+",";
            break;
          case Number:
            strSQL +=func.checkInt(arrValue[i])+",";
            break;
          case String:
            strSQL +="'"+func.checkStr(arrValue[i])+"',";
            break;
          case Date:
            strSQL +="#"+func.getDateTimeString("YY-MM-DD hh:ii:ss",arrValue[i])+"#,";
        }
      }
    }
    strSQL=strSQL.slice(0,-1);
    if(strWhere!=undefined){strSQL+=" WHERE "+strWhere;}

    this.exec(strSQL);

    return true;
  }

  // DB Update ----------------------------------
  this.updateSQL = function(strTable, strValue, strWhere){
    // Construct SQL string
    var strSQL="UPDATE "+strTable+" SET "+strValue;
    if(strWhere!=undefined){strSQL+=" WHERE "+strWhere;}

    this.exec(strSQL);
    
    return true;

  }

  // DB Insert ----------------------------------
  this.insert = function(strTable, arrValue){
    // Construct SQL string
    var strSQL="INSERT INTO "+strTable+" (";
    var strFields="", strValues="";
    for(i in arrValue){
      if(arrValue[i]!=undefined){
        strFields += i + ",";
        switch(arrValue[i].constructor){
          case Boolean:
            strValues +=arrValue[i]+",";
            break;
          case Number:
            strValues +=func.checkInt(arrValue[i])+",";
            break;
          case String:
            strValues +="'"+func.checkStr(arrValue[i])+"',";
            break;
          case Date:
            strValues +="#"+func.getDateTimeString("YY-MM-DD hh:ii:ss",arrValue[i])+"#,";
        }
      }
    }
    strSQL+=strFields.slice(0,-1)+") VALUES ("+strValues.slice(0,-1)+")";

    this.exec(strSQL);

    return true;
  }

  // DB Delete ----------------------------------
  this.doDelete = function(strTable, strWhere, strRange){
    this.exec("DELETE "+(strRange ? strRange : "*")+" FROM "+strTable+" WHERE "+strWhere);
  }

  // Simple Execute ----------------------------------
  this.exec = function(strSQL){
    if(!strSQL) return false;

    this.queryCount++;

    // Debug
    if(inDebug){this.debugData.push([strSQL, "-", "-"]);}

    // Check If the Connection is opened
    if(!this.opened){
      this.open();
    }

    try{
      dbConnection.Execute(strSQL);
    }catch(e){
      errorMessage(e);
    }
  
  }

}

</script>
