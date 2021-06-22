## *0.3.0* - 2021-06-22
* Add compatibility with crystal 1.0.0

## *0.2.3* - 2020-06-14
* Fix compatibility with crystal 0.35.0

## *0.2.2* - 2020-04-12
* Fix compatibility with crystal 0.34.0

## *0.2.1* - unreleased
* Fix compatibility with crystal 0.33.0

## **0.2.0** - 2017-10-02
* New: `Crometheus::Middleware::HttpCollector` allows easy HTTP metric
  gathering.
* Changed: Metric names now implicitly add an underscore before the
  suffix, if present.
* New: `Registry#path` specifies the HTTP request path(s) on which to
  serve metrics.
* New: `Registry#handler` returns an `HTTP::Handler` object.
* New: `Registry` by default creates a `StandardExports` (or derived)
  metric for exporting process statistics.
* New: `Crometheus.alias` allows shorthand aliasing of `LabeledMetric`
  types

## **0.1.1** - 2017-02-06
* Initial release
* Includes Gauges, Counters, Summaries, and Histograms
* Includes Registry class with basic server functionality
