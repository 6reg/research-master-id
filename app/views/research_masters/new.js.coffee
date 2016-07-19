$('#newResearchMasterModal').modal('show')
$('#newResearchMasterModal .modal-body').html("<%= j render 'form' %>")
$('#newResearchMasterModal').on 'shown.bs.modal', ->
  $('form#new_research_master').enableClientSideValidations()

$('#newResearchMasterModal').on 'change', ->
    options =
      url: '/primary_pis.json'
      getValue: 'name'
      list:
        match:
          enabled: true
        onChooseEvent: ->
          deptValue = $('#research_master_pi_name').getSelectedItemData().department
          idValue = $('#research_master_pi_name').getSelectedItemData().id
          $('#research_master_department').val(deptValue).trigger('change')
          $('#identity_id').val(idValue).trigger('change')

    $('#research_master_pi_name').easyAutocomplete(options)
