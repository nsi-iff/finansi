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

