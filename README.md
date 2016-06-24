# Simple GCharts

Create Google Charts in your views using ruby, with no Javascript required. This library
will serialize your data andautomatically load any required charts packages, and render
your charts for you. Requires jQuery.

## Example [PieChart](https://developers.google.com/chart/interactive/docs/gallery/piechart#example)

```ruby
class ActivitiesController < ActionController::Base
  def graphs
    @activities = {
      'Work' => 11,
      'Eat' => 2,
      'Commute' => 2,
      'Watch TV' => 2,
      'Sleep' => 7
    }
  end
end
```

```erb
# views/activities/graphs.html.erb
<%= google_chart :pie, ['Task', 'Hours per Day'], @activities.map { |k,v| [k, v] }, { title: 'My Daily Activities' } %>
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple-gcharts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple-gcharts

Add script to `application.js` (or appropriate page)

```js
//= require jquery
//= require simple-gcharts
```

## Usage

See the [Google Charts Documentation](https://developers.google.com/chart) for chart type descriptions and options.

### google_chart

```ruby
def google_chart type, headers, data, opts={}, chart_id="chart-#{SecureRandom.hex(10)}", parent_tag=:div
```

| Argument     | Description                                                                                                                                                                              |  
| ----         | ----                                                                                                                                                                                     |  
| `type`       | The type of chart (e.g. `:line`, see [below](#chart-types))                                                                                                                                    |  
| `headers`    | The column data. Can be column name or object                                                                                                                                            |  
| `data`       | A 2-D array of data rows. `headers` and `data` combined are passed to [`arrayToDataTable()`](https://developers.google.com/chart/interactive/docs/datatables_dataviews#arraytodatatable) |  
| `opts`       | Options passed to `chart.draw()`                                                                                                                                                         |  
| `chart_id`   | The HTML id attribute to use for the chart                                                                                                                                               |  
| `parent_tag` | The tag used to wrap the child tags                                                                                                                                                      |  

Ruby can't make Javascript date objects, but fortunately Google Charts supports [an alternate syntax](https://developers.google.com/chart/interactive/docs/datesandtimes#dates-and-times-using-the-date-string-representation) for date and time datatypes. You can use `chart_date_format` to convert DateTime objects to the proper format. 

```ruby
def chart_date_format(datetime, time=false)
  if time
    datetime.strftime "Date(%Y, %m, %d, %H, %M, %S)"
  else
    datetime.strftime "Date(%Y, %m, %d)"
  end
end
```

### Chart Types

| Types        |  
| ----         |  
| :annotation  |  
| :area        |  
| :bubble      |  
| :bar         |  
| :calendar    |  
| :candlestick |  
| :column      |  
| :combo       |  
| :gantt       |  
| :gauge       |  
| :geochart    |  
| :histogram   |  
| :line        |  
| :map         |  
| :orgchart    |  
| :pie         |  
| :snakey      |  
| :scatter     |  
| :stepped     |  
| :table       |  
| :timeline    |  
| :treemap     |  
| :word        |  

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

