#!/usr/bin/env bash
# sets up web servers for the deployment of web_static

apt-get -y update
apt-get -y install nginx

mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/

echo '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            background-color: #120607;
            color: aliceblue;
            text-align: center;
        }

        a {
            color: bisque;
            text-decoration: none;
            font-style: italic;
            font-family: "Courier New", Courier, monospace;
            border: 2px groove;
            padding: 10px;
            border-radius: 5px;
        }

        a:hover {
            animation: color-ray 2s infinite cubic-bezier(0.47, 0, 0.745, 0.715) alternate-reverse;
        }

        @keyframes color-ray {
            0% {
                color: red;
                border-color: red;
                text-shadow: 0 0 5px red;
            }

            20% {
                color: yellow;
                border-color: yellow;
                text-shadow: 0 0 10px yellow;
            }
            
            40% {
                color: blue;
                border-color: blue;
                text-shadow: 0 0 8px blue;
            }
            
            60% {
                color: magenta;
                border-color: magenta;
                text-shadow: 0 0 3px magenta;
            }
            
            80% {
                color: cyan;
                border-color: cyan;
                text-shadow: 0 0 7px cyan;
            }
        }
    </style>
</head>
<body>
    <h1>Hello World</h1>
    <a href="https://bio.link/olajide">Adeniji Olajide</a>
</body>
</html>' > /data/web_static/releases/test/index.html

ln -sf /data/web_static/releases/test/ /data/web_static/current

chown -R ubuntu:ubuntu /data/

sed -i "/location \/ {/a $n_alias" "$nginx"

service nginx restart

exit 0
