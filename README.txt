研发园区-千株树木完善版

Standalone offline website

Extract the ZIP, then serve this directory with a local static server:

  python3 -m http.server 8080

Open http://localhost:8080 in a browser. Opening index.html through file:// is not supported because browsers block module and asset loading.

The package includes runtime.js, project.json and all referenced binary assets. It does not require a CDN or an internet connection. Keep the assets/ directory and project.json beside index.html.
