(function($)
{
	// generate easy-pie-charts
	if ($('.easy-pie').length && $.fn.easyPieChart)
	{
		$.each($('.easy-pie'), function(k,v)
		{
			var color = "#1e88e5";
			if ($(this).is('.info')) color = "#1e88e5";
			if ($(this).is('.danger')) color = "#b71c1c";
			if ($(this).is('.success')) color = "#00897b";
			if ($(this).is('.warning')) color = "#e65100";
			if ($(this).is('.inverse')) color = "#9e9e9e";


			$(v).easyPieChart({
				barColor: color,
				animate: ($('html').is('.ie') ? false : 3000),
                lineWidth: 4,
                size: 50
			});
		});
	}
})(jQuery);