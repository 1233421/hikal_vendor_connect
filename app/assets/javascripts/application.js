//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require jquery-validation
//= require viewer
//= require jquery-viewer
//= require stisla
//= require nice-scroll
//= require sweet-alert
//= require scripts
//= require custom
//= require_self


$(document).ready(function(){
	$.validator.addMethod('aadar', function(value){
	  return /^\d{4}\s?\d{4}\s?\d{4}$/.test(value); 
	}, "Invalid Aadhar Number");

	$.validator.addMethod('pan', function(value){
	  return /^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/.test(value); 
	}, "Invalid Pan Number");

	$.validator.addMethod('pin', function(value){
	  return /^(\d{4}|\d{6})$/.test(value); 
	}, "Invalid PIN Code");

	$.validator.addMethod('gst', function(value){
	  return /^([0-2][0-9]|[3][0-7])[A-Z]{3}[ABCFGHLJPTK][A-Z]\d{4}[A-Z][A-Z0-9][Z][A-Z0-9]$/.test(value); 
	}, "Invalid GST Number");

  $(".uploadable-form select.form-control").on('change', function(){
    if( this.value == '1'){
      $("#" + $(this).data('id') ).removeClass('d-none')
      $("#" + this.id + "_doc").prop("disabled", false)
    } else {
      $("#" + $(this).data('id') ).addClass('d-none')
      $("#" + this.id + "_doc").prop("disabled", true)
    }
  })

  $("[data-validate]").validate({
    errorClass: "is-invalid",
    validClass: "is-valid",
    ignore: ":hidden"
  })

  $(".image-view img").viewer();

  $(".gst-enabler").on('change', initGSTfields);

  $('.custom-file-input').on('change',function(e){
    //get the file name
    var fileName = e.target.files[0].name;
    //replace the "Choose a file" label
    $(this).next('.custom-file-label').html(fileName);
	})
})


function initGSTfields(){
	var isGSTMandatory = $(".gst-enabler").filter(function(index, $field){ 
		return $($field).val() == 1
	}).length

	if( isGSTMandatory ){
		$("#gst_content").removeClass('d-none')
	} else {
		$("#gst_content").addClass('d-none')
	}
}

function rejectWithReason(id){
	swal({ 
		title: "reason for Rejection", 
		content: 'input'
	}).then(function(reason){ 
		if( !!reason ){
			$.ajax({
				url: "/employees/reject",
				method: 'post',
				datatype: 'json',
				data: {
					id: id,
					reason: reason
				},
				success: function(response){
					window.location.reload();
				}
			})
		}
	})
}

function approve(id){
	$.ajax({
		url: "/employees/approve",
		method: 'post',
		datatype: 'json',
		data: {
			id: id
		},
		success: function(response){
			window.location.reload();
		}
	})
}

function rejectWithReasonByAdmin(id){
	swal({ 
		title: "reason for Rejection", 
		content: 'input'
	}).then(function(reason){ 
		if( !!reason ){
			$.ajax({
				url: "/admins/reject",
				method: 'post',
				datatype: 'json',
				data: {
					id: id,
					reason: reason
				},
				success: function(response){
					window.location.reload();
				}
			})
		}
	})
}

function approveByAdmin(id){
	$.ajax({
		url: "/admins/approve",
		method: 'post',
		datatype: 'json',
		data: {
			id: id
		},
		success: function(response){
			window.location.reload();
		}
	})
}