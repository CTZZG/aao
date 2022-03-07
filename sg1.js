addEventListener(
  "fetch",event => {
     let url=new URL(event.request.url);
     url.hostname="hsg.my2g.cf";
     let request=new Request(url,event.request);
     event. respondWith(
       fetch(request)
     )
  }
)
