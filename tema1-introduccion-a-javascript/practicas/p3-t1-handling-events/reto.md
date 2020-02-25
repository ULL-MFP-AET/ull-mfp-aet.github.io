# Reto Async Serialize

Lea los contenidos del tutorial [https://github.com/ULL-ESIT-PL/async-js-series-webpack](https://github.com/ULL-ESIT-PL/async-js-series-webpack).

Escriba su propia versión de la función `series` que resuelva el problema de la secuencialización de las callbacks:

```js
series(
  [
     cb => loadScript('/script-1.js', cb),
     cb => loadScript('/script-2.js', cb),
     cb => loadScript('/script-3.js', cb)
   ],
   (err, results) => p.innerHTML = results.map(s => s.src).join("<br/>")
);
```

## Referencias 

* [Repo ULL-ESIT-PL/async-js-series-webpack](https://github.com/ULL-ESIT-PL/async-js-series-webpack)
* [A pure ESM version of Async](https://www.npmjs.com/package/async-es)
* [Webpack: Getting started](https://webpack.js.org/guides/getting-started/)
* [Webpack devserver](https://webpack.js.org/configuration/dev-server/)
