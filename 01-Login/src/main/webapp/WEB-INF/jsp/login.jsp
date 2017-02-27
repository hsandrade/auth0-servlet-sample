<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/css/jquery.growl.css"/>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="https://cdn.auth0.com/js/lock/10.11.0/lock.min.js"></script>
    <script src="/js/jquery.growl.js" type="text/javascript"></script>
</head>
<body>
	<div id="containerLogin" class="container"></div>
   <script type="text/javascript">
	    var opcoes = {
	    	language: "pt-br",
	    	 languageDictionary: {
				title: "Planta Certo"
			},	    	
	    	socialButtonStyle: "small",
			theme: {
				primaryColor: "green",
				logo: 'https://www.plantacerto-local.com.br/theme-plantacerto/images/customizado/logo-login.png'
			}
	    };    
        $(function () {
            var lock = new Auth0Lock('${clientId}', '${clientDomain}', {
            	//container: "containerLogin",
                auth: {
                    redirectUrl: '${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}' + '/callback',
                    responseType: 'code',
                    params: {
                        state: '${state}',
                        // Learn about scopes: https://auth0.com/docs/scopes
                        scope: 'openid user_id name nickname email picture'
                    }
                }
            });
            lock.show(opcoes);
        });
    </script>   
</body>
</html>
