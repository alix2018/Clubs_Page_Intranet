$(document).ready ->
  $('.datetimepicker').datetimepicker pickerPosition: 'top-right';
  $("[name='my-checkbox']").bootstrapSwitch({
  	onText:"Privé";
  	offText: "Public";
  });

