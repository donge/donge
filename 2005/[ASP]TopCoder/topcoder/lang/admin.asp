<script language="JScript" runAt="server">
// Admin Language Elements
function getAdminLanguage(t){
  t["admin_login"]="Administrator Login";
  t["admin_panel"]="Administration";

  t["general_info"]="General Information";
  t["clean_cache"]="Clean Cache";
  t["open_site"]="Open Site";
  t["close_site"]="Close Site";
  t["server_software"]="Server Software";
  t["server_ip"]="Server IP";
  t["server_time"]="Server Time";
  t["app_path"]="Application Path";
  t["script_engine"]="Script Engine";
  t["req_scriptengine"]="Require Script Engine 5.5+ for better functionality";
  t["obj_fso"]="Scripting.FileSystemObject Object";
  t["req_obj_fso"]="Required for Upload and Web File Management";
  t["obj_stream"]="ADODB.Stream Object";
  t["req_obj_stream"]="Required for File Upload";
  t["obj_xmlhttp"]="MSXML2.ServerXMLHTTP Object";
  t["req_obj_xmlhttp"]="Required for Sending Trackback";
  t["obj_xmldom"]="Microsoft.XMLDOM Object";
  t["req_obj_xmldom"]="Required for Parsing Trackback Response";

  t["global_settings"]="Global Settings";
  t["blog_title"]="Blog Title";
  t["blog_desc"]="Blog Description";
  t["blog_base_url"]="Blog Base URL";
  t["blog_logo_image"]="Blog Logo Image";
  t["webmaster_name"]="WebMaster Name";
  t["webmaster_email"]="WebMaster Email";
  t["language_code"]="Language Code";
  t["language_code_ref"]="Language Code Reference for RSS";
  t["default_view"]="Default View Mode";
  t["article_per_page"]="Articles Per Page";
  t["entry_per_page"]="List Entry Per Page";
  t["apply_comm_tb"]="Applied on Comment/Trackback List Page";
  t["comment_per_page"]="Comments Per Page";
  t["comment_time_order"]="Comments Sort By";
  t["time_asc"]="Post Time Ascending";
  t["time_desc"]="Post Time Descending";
  t["apply_article_page"]="Applied on Article display page. Set to 0 to disable.";
  t["show_tb_w_comm"]="Show Trackbacks<br/>with Comments";
  t["on_comm_top"]="Before Comments";
  t["on_comm_bottom"]="After Comments";
  t["dynamic_calendar"]="Dynamic Calendar";
  t["cal_more_query"]="Require 1 more DB Query when the Article is not in current month";
  t["enable_split"]="Article Auto-Split";
  t["split_at"]="Auto-Split Article Content at";
  t["enable_reg"]="Enable User Register";
  t["enable_scode"]="Enable Security Code";
  t["enable_trackback"]="Enable Trackback";
  t["incoming"]="Incoming";
  t["outgoing"]="Outgoing";
  t["enable_comment"]="Enable Comment";
  t["max_comment_length"]="Max Comment Length";
  t["enable_guestbook"]="Enable GuestBook";
  t["gbook_page_size"]="GuestBook Page Size";
  t["chars"]="Characters";
  t["for_forms"]="For the Smilies List on the side of Message Forms";
  t["style_sheet"]="CSS Style Sheet";
  t["image_folder"]="Images Folder";
  t["smilies_folder"]="Smilies Images Folder";
  t["smilies_per_row"]="Show Smilies Per Row";
  t["flood_control"]="Flood Control";
  t["between_posts"]="Seconds Between Two Posts <span class=\"comment-text\">(Affects Posting Comments)</span>";
  t["record_visitor"]="Record Visitors";
  t["record"]="Record";
  t["visitors_not_affect"]="Visitors <span class=\"comment-text\">(Disable this will not affect the Internal Counter)</span>";
  t["enable_upload"]="Enable Upload";
  t["upload_size"]="Upload Size Limit";
  t["upload_path"]="Upload Path";
  t["upload_type"]="Upload File Types";
  t["seperate_by"]="Seperated By ,";

  t["order"]="Order";
  t["delete_cat"]="Delete Selected Categories";
  t["move_cat"]="Move Articles in Selected Categories";
  t["select_target_cat"]="Select the Target Category";
  t["from_cat"]="From Category";
  t["to_cat"]="To Category";
  t["execute"]="Execute";
  t["delete_cat_note"]="Delete a category will also delete all articles, comments, trackbacks in that category.";

  t["self"]="Self";
  t["all"]="All";
  t["delete_group"]="Delete User Group";
  t["delete_group_note"]="Delete a User Group will also delete all users in this group";

  t["delete_smilies"]="Delete Selected Smilies";

  t["word_filter"]="Word Filter";
  t["regexp"]="RegExp";
  t["replace"]="Replace";
  t["block"]="Block";
  t["delete_wordfilter"]="Delete Selected WordFilter";

  t["database"]="Database";
  t["db_path"]="Database Path";
  t["db_size"]="Database Size";
  t["backup"]="Backup";
  t["compact"]="Compact";
  t["backup_list"]="Backup File List";
  t["restore"]="Restore";
  t["confirm_restore"]="Are you sure to restore from this file?";
  t["check_exist"]="Checking Database File existence";
  t["close_conn"]="Closing Database Connection";
  t["compact_db"]="Compacting Database";
  t["copy_to_backup"]="Copying to backup file";
  t["rename_db_file"]="Renaming Temporary Database File";
  t["restore_db"]="Restoring Database File";
  t["error_occured"]="Error occured";
  t["op_result"]="Operation Result";
  t["op_done"]="Operation Done";

  t["attachments"]="Attachments";
  t["parent_folder"]="Parent Folder..";
  t["confirm_delete_file"]="Are you sure to delete this file?";
  t["confirm_delete_folder"]="Are you sure to delete this folder?";
  t["delete_folder_note"]="You can only delete empty Folders";

  t["show_announce"]="Show Announcement";

  t["misc"]="Miscellaneous";
  t["resync_global_stats"]="Resync Global Statistic";
  t["processed"]="Processed ";
  t["entries"]=" Entries";
  t["resync_cat_stats"]="Resync Category Statistic";
  t["resync_article_stats"]="Resync Article Statistic";
  t["resync_user_stats"]="Resync User Statistic";
  t["clean_user"]="Clean Inactive User Account";
  t["clean_visitor_record"]="Clean Visitor Counter Records";
  t["clean_gbook_record"]="Clean GuestBook Entries Older Than 30 Days";
  t["resync_note"]="Some of these operations may take a long time while running.";
}
</script>