// all budgets by source
$(function() {
  var data = eval($('#budget-by-source').attr('chart-data'))

  $.jqplot('budget-by-source', [data], {
    title: 'All budgets by Source',
    seriesDefaults:{renderer:$.jqplot.PieRenderer, rendererOptions:{sliceMargin:3, lineLabels: true}}
  });
});


// annual evolution of total budget
$(function() {
  chart_div = $('#annual-evolution-of-total-budget')
  var data = eval(chart_div.attr('chart-data'))

  $.jqplot('annual-evolution-of-total-budget', [data], {
    title: 'Annual evolution of total budget',
    seriesDefaults: {
      renderer:$.jqplot.BarRenderer,
      rendererOptions: { barPadding: 8, barMargin: 20 }
    },
    axes: {
      xaxis: {
        renderer: $.jqplot.CategoryAxisRenderer,
        ticks: eval(chart_div.attr('chart-column-data'))
      },
      yaxis: {min: 0}
    }
  });
});


$(function() {
  chart_div = $('#budget-by-source-annual-evolution')
  data = eval(chart_div.attr('chart-data'))
  legend = eval(chart_div.attr('chart-legend'))
  columns = eval(chart_div.attr('chart-column-data'))

  $.jqplot('budget-by-source-annual-evolution', data, {
    legend:{show:true, location:'ne', xoffset:55},
    title:'Budget by source annual evolution',
    seriesDefaults:{
        renderer:$.jqplot.BarRenderer,
        rendererOptions:{barPadding: 8, barMargin: 20}
    },
    series: legend,
    axes:{
        xaxis:{
            renderer:$.jqplot.CategoryAxisRenderer,
            ticks: columns
        },
        yaxis:{min:0}
    }
  });
});

