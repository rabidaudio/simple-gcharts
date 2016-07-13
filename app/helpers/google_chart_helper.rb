module GoogleChartHelper

  def google_chart type, headers, data, opts={}, chart_id="chart-#{SecureRandom.hex(10)}", parent_tag=:div
    content_tag(parent_tag) do
      c = content_tag(:script, {data: data.prepend(headers), options: opts}.to_json, {type: "text/json", chart: chart_id}, false)
      c << content_tag(:div, "", class: "google-chart", id: chart_id, chart_type: type)
    end
  end

  def chart_date_format(datetime, time=false)
    # can't use strftime for month because stupid javascript zero-indexes months
    datetime.strftime "Date(%Y, #{datetime.month - 1}, %d#{", %H, %M, %S" if time})"
  end
end