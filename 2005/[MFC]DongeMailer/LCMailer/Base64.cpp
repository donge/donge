#include "StdAfx.h"
#include "Base64.h"

//##ModelId=43B25EC901A5
CString CBase64::Encode(LPCTSTR szEncoding, int nSize)
{
	//Base64编码字符集：
	CString m_sBase64Alphabet = _T("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
	char *szOutput;
	//计算空间
	int size = (nSize + 2) / 57 * 2;
	size += nSize % 3 != 0 ? (nSize - nSize % 3 + 3) / 3 * 4 : nSize / 3 * 4;
	szOutput = new char[size + 1];
	memset(szOutput, 0, size + 1);

	LPCTSTR szInput = szEncoding;

	int nBitsRemaining = 0, nPerRowCount = 0;//换行计数
    register int nBitStorage = 0, nScratch = 0;
	int i, lp, endlCount;

	for(i=0, lp=0, endlCount = 0; lp < nSize; lp++)
	{
		nBitStorage = (nBitStorage << 8) | (szInput[lp] & 0xff);//1 byte//the lowest-byte to 0 not cycle
		nBitsRemaining += 8;//读了一个字节，加八位

		do//nBitStorage"剩下的位"记录变量
		{
			nScratch = nBitStorage >> (nBitsRemaining - 6) & 0x3f;//提出最前的六位
			szOutput[i++] = m_sBase64Alphabet[nScratch];
			nPerRowCount++;
			if(nPerRowCount >= 76)
			{
				szOutput[i++] = '\r';
				szOutput[i++] = '\n';
				endlCount += 2;
				nPerRowCount = 0;
			}
			nBitsRemaining -= 6;
		}while(nBitsRemaining >= 6);
	}

	if(nBitsRemaining != 0)
	{
		//原数据最后多一个两个字节时进入，编码未结束nBitsRemaining!=0
		nScratch = nBitStorage << (6-nBitsRemaining);//空位补0
		nScratch &= 0x3f;
		szOutput[i++] = m_sBase64Alphabet[nScratch];
		nPerRowCount++;
		if(nPerRowCount >= 76)
		{
			szOutput[i++] = '\r';
			szOutput[i++] = '\n';
			endlCount += 2;
			nPerRowCount = 0;
		}
	} 

	// Pad with '=' as per RFC 1521
	while((i - endlCount) % 4 != 0)
	{
		szOutput[i++] = '=';
		nPerRowCount++;
		if(nPerRowCount >= 76)
		{
			szOutput[i++] = '\r';
			szOutput[i++] = '\n';
			endlCount += 2;
			nPerRowCount = 0;
		}
	}
	
	CString strResult = szOutput;
	delete[] szOutput;
	return strResult;
}
