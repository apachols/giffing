All credit to the hypnotoad(s):
* http://beesandbombs.tumblr.com/
* http://hexeosis.tumblr.com/
* http://www.anokafaruqee.com
* http://those-visions-have-no-end.tumblr.com/
* http://flotsam.sellingwaves.com/

## How to Run Locally
* clone this repo
* run `bower install` and `npm install`
* run `bower --force` to build and `npm start` to run

## How to Run on a Server
Add this or something like it to your nginx config:
```
server {
    listen 80;
    server_name helpimstoned.com giffing.metal-heart.org;
    location / {
        root [the public directory];
        index index.html;
    }
    location /api {
        proxy_set_header   X-Real-IP $remote_addr;
        proxy_set_header   Host      $http_host;
        proxy_pass         http://127.0.0.1:9000;
    }
    location /content {
        root [parent directory of /content];
        expires 1y;
    }
}
```

Run the program with something like:
`forever start dist/server/app.js`

## Suggest Gifs
Send links to gifs@metal-heart.org
