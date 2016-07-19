//=require jquery
//=require loader
(function($){

  var TYPES = {
    annotation:  { package: 'annotationchart', name: 'AnnotationChart' },
    area:        { package: 'corechart',       name: 'AreaChart' },
    bubble:      { package: 'corechart',       name: 'BubbleChart' },
    bar:         { package: 'corechart',       name: 'BarChart' },
    calendar:    { package: 'calendar',        name: 'Calendar' },
    candlestick: { package: 'corechart',       name: 'CandlestickChart' },
    column:      { package: 'corechart',       name: 'ColumnChart' },
    combo:       { package: 'corechart',       name: 'ComboChart' },
    gantt:       { package: 'gantt',           name: 'Gantt' },
    gauge:       { package: 'gauge',           name: 'Gauge' },
    geochart:    { package: 'geochart',        name: 'GeoChart' },
    histogram:   { package: 'corechart',       name: 'Histogram' },
    line:        { package: 'corechart',       name: 'LineChart' },
    map:         { package: 'map',             name: 'Map' },
    orgchart:    { package: 'orgchart',        name: 'OrgChart' },
    pie:         { package: 'corechart',       name: 'PieChart' },
    snakey:      { package: 'snakey',          name: 'Sankey' },
    scatter:     { package: 'corechart',       name: 'ScatterChart' },
    stepped:     { package: 'corechart',       name: 'SteppedAreaChart' },
    table:       { package: 'table',           name: 'Table' },
    timeline:    { package: 'timeline',        name: 'Timeline' },
    treemap:     { package: 'treemap',         name: 'TreeMap' },
    word:        { package: 'wordtree',        name: 'WordTree' }
  };

  function loadPackages(){
    var packages = $('.google-chart').map(function(){ return TYPES[$(this).attr('chart_type')].package; });
    ( $.inArray('map', packages) >= 0 || $.inArray('geochart', packages) >= 0
      ? $.getScript('https://www.google.com/jsapi')
      : $.Deferred().resolve().promise()
    ).then(function(){
      google.charts.load('current', {'packages': $.unique(packages) });
      google.charts.setOnLoadCallback(createCharts);
    });
  }

  function createCharts(){
    $('.google-chart').each(function(){
      var type = $(this).attr('chart_type');
      var data = $('script[chart='+$(this).attr('id')+']').text();
      if(!!TYPES[type] && !!data){
        var config = JSON.parse(data);
        var chart = new google.visualization[TYPES[type].name](this);
        chart.draw(google.visualization.arrayToDataTable(config.data), config.options);
      }
    });
  }
  
  $(document).on('ready', loadPackages);
})(jQuery);
