<!DOCTYPE html>
<html lang="en">
	<head>
		<title>CampFireManager</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="media/JQM/jquery.mobile-1.1.1.min.css">
		<script src="media/JQM/jquery-1.7.1.min.js"></script>
		<script src="media/JQM/jquery.mobile-1.1.1.min.js"></script>
        <script>if (!localStorage.getItem('CFMurl')) { localStorage.setItem('CFMurl', "<!--SM:$SiteConfig['baseurl']:SM-->rest/"); }</script>
		<script src="media/CampFireManager.js"></script>
	</head>
	<body>
        <input type="hidden" id="pageIdentifier" page="thegrid" />
		<div data-role="page" id="timetable">
			<div data-role="header">
				<a href="#" data-icon="refresh">Refresh</a>
				<h1><!--SM:if isset($SiteConfig['Site_Name']):SM--><!--SM:$SiteConfig['Site_Name']:SM--><!--SM:else:SM-->Campfire Manager<!--SM:/if:SM--></h1>
				<a href="" data-rel="dialog" data-icon="gear">Login</a>
			</div>
			<div data-role="content">
				<ul id="thegrid" data-theme="d" data-divider-theme="d">
				</ul>
			</div>
		</div>
	</body>
</html>
