module GoogleChartHelper

  def google_chart type, headers, data, opts={}, chart_id=nil, parent_tag=:div
    chart_id ||= "chart-#{SecureRandom.hex(10)}"
    content_tag(parent_tag) do
      c = content_tag(:script, {data: data.prepend(headers), options: opts}.to_json, {type: "text/json", chart: chart_id}, false)
      c << content_tag(:div, "", class: "google-chart", id: chart_id, chart_type: type)
    end
  end

  def chart_date_format(datetime, time=false)
    if time
      datetime.strftime "Date(%Y, %m, %d, %H, %M, %S)"
    else
      datetime.strftime "Date(%Y, %m, %d)"
    end
  end
end