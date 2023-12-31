<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>IMASNET SCANNER</title>
    <style>
        body {
            background-color: #000000;
            color: #ffffff;
        }

        video {
            width: 100% !important;
            height: auto !important;
        }

        .btn {
            margin-top: 5px;
            margin-bottom: 10px;
            padding: 5px;
            background-color: #f2f2f2;
            color: #000000;
            border-radius: 3px;
            width: 150px;
            cursor: pointer;
        }

        .camera {
            width: 95%;
        }

        a {
            text-decoration: none;
            color: #20a8d8;
        }

        .icon {
            font-family: "fontello";
            font-style: normal;
            font-weight: normal;
            display: inline-block;
            text-decoration: inherit;
            width: 1em;
            margin-right: .2em;
            text-align: center;
            font-variant: normal;
            text-transform: none;
            line-height: 1em;
            margin-left: .2em;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
    </style>
    <script src="<?= base_url('assets/plugins/scanqrcode/llqrcode.js'); ?>"></script>
    <script src="<?= base_url('assets/plugins/scanqrcode/mikhmon_webqr.js'); ?>"></script>
</head>

<body>
    <center>
        <div id="main">
            <div id="mainbody">

                <div class="camera" id="outdiv"></div>

                <div style="display: table;">

                    <div style="display: table-row;">

                        <div style="display: table-cell; padding:3px;">
                            <div class="btn" id="reload" onclick="location.reload();"><i class="icon icon-arrows-cw">&#xe800;</i> Reload Camera</div>
                        </div>

                        <div style="display: table-cell; padding:3px;">
                            <a class="btn" href="intent://laksa19.github.io/myqr#Intent;scheme=http;package=com.android.chrome;end"><i class="icon icon-chrome-1">&#xf268;</i> Open in Chrome</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>IMASNET SCANNER <br>Powered by <a href="http://www.webqr.com">webqr.com</a></div>
    </center>

    <canvas style="display:none;" id="qr-canvas" width="800" height="600"></canvas>

    <script type="text/javascript">
        load();
    </script>
</body>

</html>