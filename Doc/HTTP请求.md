###### 更新时间：引擎64_23.06.28

外部工具推荐：需要架设 Httppost自定义数据传输推荐使用：http://httppost.cn/ (非官方).
(相关产品由第三方提供，996引擎方不负责售前售后服务，请用户自行甄别选择)

### HTTP请求

httppost

注意：不提供回调函数与返回值

## 参数

| 参数名 | 必选 | 类型           | 说明     |
| ------ | ---- | -------------- | -------- |
| url    | 是   | str            | 链接地址 |
| suffix | 是   | str            | 请求信息 |
| head   | 是   | json字符串格式 | 请求头   |

## 返回值

类型：无返回值

## 示例代码

```
复制<?php

    // echo json_encode(['a'=>123]);

    $_data = [];

    $_data['server'] = $_SERVER;

    $_data['files'] = $_FILES;

    $_data['post'] = $_POST;

    $_data['tokenn'] = '996633';

    $_data['get'] = $_GET;

    $_data['input'] = json_decode(file_get_contents('php://input'),true);

    echo json_encode($_data, JSON_UNESCAPED_UNICODE);
```

```
复制示例

    httppost("http://localhost/php/test.php",'{token:mir200post}','{Host:system}')





debug日志

{

    "server":{

        "PATH":"C:\\Program Files (x86)\\Common Files\\Oracle\\Java\\javapath;F:\\VMware\\bin\\;C:\\Windows\\system32;C:\\Windows;C:\\Windows\\System32\\Wbem;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\;C:\\Windows\\System32\\OpenSSH\\;C:\\Program Files\\TortoiseSVN\\bin;C:\\Microsoft VS Code\\bin;C:\\Program Files (x86)\\GtkSharp\\2.12\\bin;C:\\Program Files (x86)\\Windows Kits\\8.1\\Windows Performance Toolkit\\;C:\\Program Files\\Microsoft SQL Server\\110\\Tools\\Binn\\;C:\\Program Files (x86)\\Microsoft SDKs\\TypeScript\\1.0\\;C:\\Program Files\\Microsoft SQL Server\\120\\Tools\\Binn\\;C:\\Users\\admin\\AppData\\Local\\Programs\\Python\\Python39\\Scripts\\;C:\\Users\\admin\\AppData\\Local\\Programs\\Python\\Python39\\;C:\\Cocos\\Cocos2d-x\\Cocos2d-x-3.10\\templates;C:\\Cocos\\Cocos2d-x\\Cocos2d-x-3.10\\tools\\cocos2d-console\\bin;C:\\Users\\admin\\AppData\\Local\\Microsoft\\WindowsApps",

        "SYSTEMROOT":"C:\\Windows",

        "COMSPEC":"C:\\Windows\\system32\\cmd.exe",

        "PATHEXT":".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC",

        "WINDIR":"C:\\Windows",

        "PHPRC":"F:\/php\/phpstudy_pro\/Extensions\/php\/php7.3.4nts",

        "_FCGI_SHUTDOWN_EVENT_":"8968",

        "HTTP_CONNECTION":"close",

        "SCRIPT_NAME":"\/php\/test.php",

        "REQUEST_URI":"\/php\/test.php",

        "QUERY_STRING":"",

        "REQUEST_METHOD":"POST",

        "SERVER_PROTOCOL":"HTTP\/1.1",

        "GATEWAY_INTERFACE":"CGI\/1.1",

        "REMOTE_PORT":"49742",

        "SCRIPT_FILENAME":"F:\/php\/phpstudy_pro\/WWW\/php\/test.php",

        "SERVER_ADMIN":"admin@example.com",

        "CONTEXT_DOCUMENT_ROOT":"F:\/php\/phpstudy_pro\/WWW",

        "CONTEXT_PREFIX":"",

        "REQUEST_SCHEME":"http",

        "DOCUMENT_ROOT":"F:\/php\/phpstudy_pro\/WWW",

        "REMOTE_ADDR":"::1",

        "SERVER_PORT":"80",

        "SERVER_ADDR":"::1",

        "SERVER_NAME":"system",

        "SERVER_SOFTWARE":"Apache\/2.4.39 (Win64) OpenSSL\/1.1.1b mod_fcgid\/2.3.9a mod_log_rotate\/1.02",

        "SERVER_SIGNATURE":"",

        "SystemRoot":"C:\\Windows",

        "HTTP_CACHE_CONTROL":"no-cache",

        "CONTENT_LENGTH":"16",

        "HTTP_USER_AGENT":"Microsoft Internet Explorer",

        "HTTP_HOST":"system",

        "CONTENT_TYPE":"application\/x-www-form-urlencoded",

        "FCGI_ROLE":"RESPONDER",

        "PHP_SELF":"\/php\/test.php",

        "REQUEST_TIME_FLOAT":1688001980.321139,

        "REQUEST_TIME":1688001980

    },

    "files":[



    ],

    "post":{

        "token":"mir200post"

    },

    "tokenn":"996633",

    "get":[



    ],

    "input":null

}
```

httpget

## 参数

| 参数名 | 必选 | 类型 | 说明     |
| ------ | ---- | ---- | -------- |
| url    | 是   | str  | 链接地址 |

## 返回值

类型：无返回值

```
复制示例

    httpget("http://localhost/php/test.php")



debug日志

{

    "server":{

        "PATH":"C:\\Program Files (x86)\\Common Files\\Oracle\\Java\\javapath;F:\\VMware\\bin\\;C:\\Windows\\system32;C:\\Windows;C:\\Windows\\System32\\Wbem;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\;C:\\Windows\\System32\\OpenSSH\\;C:\\Program Files\\TortoiseSVN\\bin;C:\\Microsoft VS Code\\bin;C:\\Program Files (x86)\\GtkSharp\\2.12\\bin;C:\\Program Files (x86)\\Windows Kits\\8.1\\Windows Performance Toolkit\\;C:\\Program Files\\Microsoft SQL Server\\110\\Tools\\Binn\\;C:\\Program Files (x86)\\Microsoft SDKs\\TypeScript\\1.0\\;C:\\Program Files\\Microsoft SQL Server\\120\\Tools\\Binn\\;C:\\Users\\admin\\AppData\\Local\\Programs\\Python\\Python39\\Scripts\\;C:\\Users\\admin\\AppData\\Local\\Programs\\Python\\Python39\\;C:\\Cocos\\Cocos2d-x\\Cocos2d-x-3.10\\templates;C:\\Cocos\\Cocos2d-x\\Cocos2d-x-3.10\\tools\\cocos2d-console\\bin;C:\\Users\\admin\\AppData\\Local\\Microsoft\\WindowsApps",

        "SYSTEMROOT":"C:\\Windows",

        "COMSPEC":"C:\\Windows\\system32\\cmd.exe",

        "PATHEXT":".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC",

        "WINDIR":"C:\\Windows",

        "PHPRC":"F:\/php\/phpstudy_pro\/Extensions\/php\/php7.3.4nts",

        "_FCGI_SHUTDOWN_EVENT_":"8860",

        "SCRIPT_NAME":"\/php\/test.php",

        "REQUEST_URI":"\/php\/test.php",

        "QUERY_STRING":"",

        "REQUEST_METHOD":"GET",

        "SERVER_PROTOCOL":"HTTP\/1.1",

        "GATEWAY_INTERFACE":"CGI\/1.1",

        "REMOTE_PORT":"54798",

        "SCRIPT_FILENAME":"F:\/php\/phpstudy_pro\/WWW\/php\/test.php",

        "SERVER_ADMIN":"admin@example.com",

        "CONTEXT_DOCUMENT_ROOT":"F:\/php\/phpstudy_pro\/WWW",

        "CONTEXT_PREFIX":"",

        "REQUEST_SCHEME":"http",

        "DOCUMENT_ROOT":"F:\/php\/phpstudy_pro\/WWW",

        "REMOTE_ADDR":"::1",

        "SERVER_PORT":"80",

        "SERVER_ADDR":"::1",

        "SERVER_NAME":"localhost",

        "SERVER_SOFTWARE":"Apache\/2.4.39 (Win64) OpenSSL\/1.1.1b mod_fcgid\/2.3.9a mod_log_rotate\/1.02",

        "SERVER_SIGNATURE":"",

        "SystemRoot":"C:\\Windows",

        "HTTP_CONNECTION":"close",

        "HTTP_HOST":"localhost",

        "HTTP_USER_AGENT":"Mozilla\/4.0 (compatible; MSIE 7.0; Windows NT 10.0; Win64; x64; Trident\/7.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729)",

        "HTTP_ACCEPT_ENCODING":"gzip, deflate",

        "HTTP_UA_CPU":"AMD64",

        "HTTP_ACCEPT_LANGUAGE":"zh-cn",

        "HTTP_ACCEPT":"*\/*",

        "FCGI_ROLE":"RESPONDER",

        "PHP_SELF":"\/php\/test.php",

        "REQUEST_TIME_FLOAT":1687748512.883079,

        "REQUEST_TIME":1687748512

    },

    "files":[



    ],

    "post":[



    ],

    "tokenn":"996633",

    "get":[



    ],

    "input":null

}
```
