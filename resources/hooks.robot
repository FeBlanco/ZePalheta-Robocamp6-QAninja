***Settings***

Library     SeleniumLibrary

***Keywords***
Start Sesion
    Open Browser        about:blank         chrome
    Maximize Browser Window

Finish Session
    Close Browser

Login Sesions

    Start Sesion

    Go To           ${base_url}

    Login With      ${admin_user}       ${admin_pass}