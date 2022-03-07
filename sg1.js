addEventListener(
  "fetch",event => {
     let url=new URL(event.request.url);
     url.hostname="sg1.31vpn.com";
     let request=new Request(url,event.request);
     event. respondWith(
       fetch(request)
     )
  }
)
