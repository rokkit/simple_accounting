<?
session_start();

require_once('settings.php');
require_once(SITE_PATH . "/settings.php");

error_reporting(ERROR_REPORTING);

require_once(SITE_PATH . "/ace_lib/ace_classes/database.php");
require_once(SITE_PATH . "/ace_module/website/classes/site.php");
require_once(SITE_PATH . "/ace_module/website/classes/template.php");
require_once(SITE_PATH . "/ace_module/website/classes/page.php");

header("Content-Type: text/html; charset=" . SITE_CHARSET);

global $DB;
$DB = new CDatabase;
$DB->Connect();

 define('URL', $_SERVER['REQUEST_URI']);  
 
 
 //DIRS
 $arr_request = parse_url( strpos(URL, '?')>0 ? substr(URL, 0, strpos(URL, '?') ) : URL ); 
 
 $pre_tail = substr( WEBSITE_URL, strlen("http://" . $_SERVER['HTTP_HOST']) );
 
 $tail = $arr_request['path'];
 $tail = trim( substr( $tail, strlen($pre_tail) ) );
 define('TAIL', $tail);

$dirs=explode("/",TAIL);



if(TAIL=='')
{
	$id = 1;
        $queryc="select * from website_page_tab where id=1";
        if($page_row = $DB->SelectRow($queryc))
            {
                $title=$page_row['title'];
                $meta=$page_row['meta'];
            }
}
	
else
{

	$pid = 1;
	
	foreach($dirs as $dir)
		if(trim($dir)!='')
		{

			$query="select id from website_page_tab where alias='$dir' and parent_id='$pid'";
			if($pid = $DB->SelectValue($query))
			{
                            // do nothing
			}				
			else
                        CCommon::Fourofour('404 Not found');

		}
	
	$id = $pid;
        $queryc="select * from website_page_tab where id='$id'";
        if($page_row = $DB->SelectRow($queryc))
        {
            $title=$page_row['title'];
            $meta=$page_row['meta'];
        } 	
}

if(empty($id))
{ 
	CCommon::Fourofour('404 Not found');
} 

eval ("?>" . CSite::ProducePage($id) . "<?");

?>

