require 'ZOHOCRMSDK2_0'

class Field
  def self.get_fields(module_api_name)
    # """
    # This method is used to get metadata about all the fields of a module and print the response.
    # :param module_api_name: The API Name of the module to get fields
    # """

    # """
    # example
    # module_api_name = "Leads";
    # """
    fo = ZOHOCRMSDK::Fields::FieldsOperations.new(module_api_name)
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # pm.add(Fields::FieldsOperations::GetFieldsParam.type,"Unused")
    response = fo.get_fields(pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      if [204, 304].include? status_code
        print(status_code == 204 ? 'No Content' : 'Not Modified')
        return
      end
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        # Check if expected ResponseWrapper instance is received
        if response_handler.is_a? ZOHOCRMSDK::Fields::ResponseWrapper
          # Get the list of obtained Field instances
          fields = response_handler.fields
          fields.each do |field|
            print "\n"
            # Get the SystemMandatory of each Field
            print "\nField SystemMandatory: "
            print field.system_mandatory
            # Get the Webhook of each Field
            print "\nField Webhook: "
            print field.webhook
            # Get the JsonType of each Field
            print "\nField JsonType: "
            print field.json_type
            # Get the obtained Crypt instance
            crypt = field.crypt
            unless crypt.nil?
              # Get the Crypt Mode
              print "\nField Crypt Mode:"
              print crypt.mode
              # Get the Crypt Column
              print "\nField Crypt Column:"
              print crypt.column
              # Get the Crypt Table
              print "\nField Crypt Table:"
              print crypt.table
              # Get the Crypt Status
              print "\nField Crypt Status:"
              print crypt.status
            end
            # Get the FieldLabel of each Field
            print "\n Field FieldLabel: "
            print field.field_label
            tooltip = field.tooltip
            unless tooltip.nil?
              # Get the Name of the ToolTip
              print "\nField ToolTip Name:: "
              print tooltip.name
              # Get the Value of the ToolTip
              print "\nField ToolTip Value: "
              print tooltip.value
            end
            # Get the CreatedSource of each Field
            print "\nField CreatedSource: "
            print field.created_source
            # Get the FieldReadOnly of each Field
            print "\nField FieldReadOnly: "
            print field.field_read_only
            # Get the DisplayLabel of each Field
            print "\nField DisplayLabel: "
            print field.display_label
            # Get the ReadOnly of each Field
            print "\nField ReadOnly: "
            print field.read_only
            # Get the obtained AssociationDetails instance
            association_details = field.association_details
            unless association_details.nil?
              # Get the obtained LookupField instance
              lookup_field = association_details.lookup_field
              unless lookup_field.nil?
                # Get the ID of the LookupField
                print "\nField AssociationDetails LookupField ID: "
                print lookup_field.id.to_s
                # Get the Name of the LookupField
                print "\nField AssociationDetails LookupField Name: "
                print lookup_field.name
              end
              # Get the obtained LookupField instance
              related_field = association_details.related_field
              unless related_field.nil?
                # Get the ID of the RelatedField
                print "\nField AssociationDetails RelatedField ID: "
                print related_field.id.to_s
                # Get the Name of the RelatedField
                print "\nField AssociationDetails RelatedField Name: "
                print related_field.name
              end
            end
            # Get the QuickSequenceNumber of each Field
            unless field.quick_sequence_number.nil?
              print "\nField QuickSequenceNumber: "
              print field.quick_sequence_number
            end
            # Get the BusinesscardSupported of each Field
            print "\nField BusinesscardSupported: "
            print field.businesscard_supported
            # Check if MultiModuleLookup is not None
            # Get the MultiModuleLookup dict
            field.multi_module_lookup&.each do |k, v|
              print "\n"
              print k
              print v
              print "\n"
            end
            # Get the obtained Currency instance
            currency = field.currency
            unless currency.nil?
              # Get the RoundingOption of the Currency
              print "\nField Currency RoundingOption: "
              # Get the Precision of the Currency
              print currency.rounding_option
              unless currency.precision.nil?
                print "\nField Currency Precision:"
                print currency.precision
              end
            end
            # Get the ID of each Field
            print "\nField ID: "
            print field.id.to_s
            # Get if the Field is a CustomField
            unless field.custom_field
              print "\nField CustomField:"
              print field.custom_field
            end
            lookup = field.lookup
            unless lookup.nil?
              # Get the obtained Layout instance
              layout = lookup.layout
              # Check if layout is not null
              unless layout.nil?
                # Get the ID of the Layout
                print "\nField ModuleLookup Layout ID: "
                print layout.id.to_s
                # Get the Name of the Layout
                print "\nField ModuleLookup Layout Name: "
                print layout.name
              end
              # Get the DisplayLabel of the Module
              print "\nField ModuleLookup DisplayLabel: "
              print lookup.display_label
              # Get the APIName of the Module
              print "\nField ModuleLookup APIName: "
              print lookup.api_name
              # Get the Module of the ModuleLookup
              print "\nield ModuleLookup Module:  "
              print lookup.module
              unless lookup.id.nil?
                # Get the ID of the Module
                print "\nField ModuleLookup ID:"
              end
            end
            unless field.visible.nil?
              # Get the Visible of each Field'
              print "\nField Visible: "
              print field.visible
            end
            unless field.length.nil?
              # Get the Length of each Field
              print "\nField Length: "
              print field.length
            end
            view_type = field.view_type
            unless view_type.nil?
              # Get the View of the ViewType
              print "\nField ViewType View: "
              print view_type.view
              # Get the Edit of the ViewType
              print "\nField ViewType Edit: "
              print view_type.edit
              # Get the Create of the ViewType
              print "\nField ViewType Create: "
              print view_type.create
              # Get the QuickCreate of the ViewType
              print "\nField ViewType QuickCreate: "
              print view_type.quick_create
            end
            subform = field.subform
            unless subform.nil?
              # Get the obtained Layout instance
              layout = subform.layout
              # Check if layout is not null
              unless layout.nil?
                # Get the ID of the Layout
                print "\nField Subform Layout ID: "
                print layout.id.to_s
                # Get the ID of the Layout
                print "\nField Subform Layout Name: "
                print layout.name
              end
              # Get the DisplayLabel of the Module
              print "\nField Subform DisplayLabel: "
              print subform.display_label
              # Get the APIName of the Module
              print "\nField Subform APIName: "
              print subform.api_name
              # Get the Module of the ModuleLookup
              print "\nField Subform Module: "
              print subform.module
              unless subform.id.nil?
                # Get the ID of the Module
                print "\nField Subform ID: "
                print subform.id.to_s
              end
            end
            # Get the APIName of each Field
            print "\nField APIName: "
            print field.api_name
            # Get the obtained Unique instance
            unique = field.unique
            unless unique.nil?
              # Get the Casesensitive of the Unique
              print "\nField Unique Casesensitive : "
              print unique.casesensitive
            end
            if field.history_tracking.nil?
              # Get the HistoryTracking of each Field
              print "\nField HistoryTracking: "
              print field.history_tracking
            end
            # Get the DataType of each Field
            print "\nField DataType: "
            print field.data_type
            # Get the Object obtained Formula instance
            formula = field.formula
            # Check if formula is not null
            unless formula.nil?
              # Get the ReturnType of the Formula
              print "\nField Formula ReturnType : "
              print formula.return_type
              # Get the Expression of the Formula
              unless formula.expression.nil?
                print "\nField Formula Expression : "
                print formula.expression
              end
            end
            unless field.decimal_place.nil?
              # Get the DecimalPlace of each Field
              print "\nField DecimalPlace: "
              print field.decimal_place
            end
            # Get the MassUpdate of each Field
            print "\nField MassUpdate: "
            print field.mass_update
            unless field.blueprint_supported.nil?
              # Get the BlueprintSupported of each Field
              print "\nField BlueprintSupported: "
              print field.blueprint_supported
            end
            # Check if multiSelectLookup is not None
            multi_select_lookup = field.multiselectlookup
            unless multi_select_lookup.nil?
              # Get the DisplayValue of the MultiSelectLookup
              print "\n DisplayLabel:"
              print multi_select_lookup.display_label
              # Get the LinkingModule of the MultiSelectLookup
              print "\n LinkingModule:"
              print multi_select_lookup.linking_module
              # Get the LookupApiname of the MultiSelectLookup
              print "\n LookupApiname:"
              print multi_select_lookup.lookup_apiname
              # Get the APIName of the MultiSelectLookup
              print "\n APIName:"
              print multi_select_lookup.api_name
              # Get the ConnectedlookupApiname of the MultiSelectLookup
              print "\n ConnectedlookupApiname:"
              print multi_select_lookup.connectedlookup_apiname
              # Get the ID of the MultiSelectLookup
              print "\n ID:"
              print multi_select_lookup.id.to_s
            end
            pick_list_values = field.pick_list_values
            # Get the DisplayValue of each PickListValue
            # Get the SequenceNumber of each PickListValue
            # Get the ExpectedDataType of each PickListValue
            # Get the ActualValue of each PickListValue
            # Get the SysRefName of each PickListValues
            # Get the Type of each PickListValues
            pick_list_values&.each do |pick_list_value|
              # Get the DisplayValue of each PickListValue
              print "\nField PickListValue DisplayValue: "
              print pick_list_value.display_value
              # Get the SequenceNumber of each PickListValue
              print "\nField PickListValue SequenceNumber:: "
              print pick_list_value.sequence_number unless pick_list_value.sequence_number.nil?
              # Get the ExpectedDataType of each PickListValue
              print "\nField PickListValue ExpectedDataType: "
              print pick_list_value.expected_data_type
              pick_list_value.maps&.each do |map|
                print map
              end
              # Get the ActualValue of each PickListValue
              print "\nField PickListValue ActualValue: "
              print pick_list_value.actual_value
              # Get the SysRefName of each PickListValues
              print "\nField PickListValue SysRefName: "
              print pick_list_value.sys_ref_name
              # Get the Type of each PickListValues
              print "\nField PickListValue Type: "
              print pick_list_value.type
            end
            # Check if autoNumber is not None
            auto_number = field.auto_number
            unless auto_number.nil?
              # Get the Prefix of the AutoNumber
              print "\nField AutoNumber Prefix: "
              print auto_number.prefix
              # Get the Suffix of the AutoNumber
              print "\nField AutoNumber Suffix: "
              print auto_number.suffix
              # Get the StartNumber of the AutoNumber
              unless auto_number.start_number.nil?
                print "\nField AutoNumber StartNumber: "
                print auto_number.start_number
              end
            end
            default_value = field.default_value
            unless default_value.nil?
              # Get the DefaultValue of each Field
              print "\nField DefaultValue"
              print default_value
            end
            section_id = field.section_id
            unless section_id.nil?
              # Get the SectionId of each Field
              print "\nField SectionId: "
              print section_id
            end
            # Check if ValidationRule is not None
            validation_rule = field.validation_rule
            # Get the validationRule dict
            validation_rule&.each do |k, v|
              print "\n"
              print k
              print v
              print "\n"
            end
            # Check if ConvertMapping is not None
            # Get the validationRule dict
            field.convert_mapping&.each do |k, v|
              print "\n"
              print k
              print v
              print "\n"
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Fields::APIException
          exception = response_handler
          # Get the Code
          print "\ncode:"
          print exception.code.value
          # Get the Status
          print "\n status:"
          print exception.status.value
          # Get the Message
          print "\n message:"
          print exception.message.value
          # Get the details map
          exception.details.each do |k, v|
            print "\n"
            print k
            print v
            print "\n"
          end
          print "\n"
        end
      elsif status_code != 204
        response_object = response.data_object
        response_object.instance_variables.each do |field|
          print field
          print "\n"
          print response_object.instance_variable_get(field)
        end
      end
    end
  end

  def self.get_field(module_api_name, field_id)
    # """
    # This method is used to get metadata about a single field of a module with fieldID and print the response.
    # :param module_api_name: The API Name of the field's module
    # :param field_id: The ID of the field to be obtained
    # """

    # """
    # example
    # module_api_name = "Leads"
    # field_id = "34096432293043"
    # """
    fo = ZOHOCRMSDK::Fields::FieldsOperations.new(module_api_name)
    # Call get_field method which takes field_id as parameter
    response = fo.get_field(field_id)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      if [204, 304].include? status_code
        print(status_code == 204 ? 'No Content' : 'Not Modified')
        return
      end
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        # Check if expected ResponseWrapper instance is received
        if response_handler.is_a? ZOHOCRMSDK::Fields::ResponseWrapper
          # Get the list of obtained Field instances
          fields = response_handler.fields
          fields.each do |field|
            print "\n"
            # Get the SystemMandatory of each Field
            print "\nField SystemMandatory: "
            print field.system_mandatory
            # Get the Webhook of each Field
            print "\nField Webhook: "
            print field.webhook
            # Get the JsonType of each Field
            print "\nField JsonType: "
            print field.json_type
            # Get the obtained Crypt instance
            crypt = field.crypt
            unless crypt.nil?
              # Get the Crypt Mode
              print "\nField Crypt Mode:"
              print crypt.mode
              # Get the Crypt Column
              print "\nField Crypt Column:"
              print crypt.column
              # Get the Crypt Table
              print "\nField Crypt Table:"
              print crypt.table
              # Get the Crypt Status
              print "\nField Crypt Status:"
              print crypt.status
            end
            # Get the FieldLabel of each Field
            print "\n Field FieldLabel: "
            print field.field_label
            tooltip = field.tooltip
            unless tooltip.nil?
              # Get the Name of the ToolTip
              print "\nField ToolTip Name:: "
              print tooltip.name
              # Get the Value of the ToolTip
              print "\nField ToolTip Value: "
              print tooltip.value
            end
            # Get the CreatedSource of each Field
            print "\nField CreatedSource: "
            print field.created_source
            # Get the FieldReadOnly of each Field
            print "\nField FieldReadOnly: "
            print field.field_read_only
            # Get the DisplayLabel of each Field
            print "\nField DisplayLabel: "
            print field.display_label
            # Get the ReadOnly of each Field
            print "\nField ReadOnly: "
            print field.read_only
            # Get the obtained AssociationDetails instance
            association_details = field.association_details
            unless association_details.nil?
              # Get the obtained LookupField instance
              lookup_field = association_details.lookup_field
              unless lookup_field.nil?
                # Get the ID of the LookupField
                print "\nField AssociationDetails LookupField ID: "
                print lookup_field.id.to_s
                # Get the Name of the LookupField
                print "\nField AssociationDetails LookupField Name: "
                print lookup_field.name
              end
              # Get the obtained LookupField instance
              related_field = association_details.related_field
              unless related_field.nil?
                # Get the ID of the RelatedField
                print "\nField AssociationDetails RelatedField ID: "
                print related_field.id.to_s
                # Get the Name of the RelatedField
                print "\nField AssociationDetails RelatedField Name: "
                print related_field.name
              end
            end
            # Get the QuickSequenceNumber of each Field
            unless field.quick_sequence_number.nil?
              print "\nField QuickSequenceNumber: "
              print field.quick_sequence_number
            end
            # Get the BusinesscardSupported of each Field
            print "\nField BusinesscardSupported: "
            print field.businesscard_supported
            # Check if MultiModuleLookup is not None
            # Get the MultiModuleLookup dict
            field.multi_module_lookup&.each do |k, v|
              print "\n"
              print k
              print v
              print "\n"
            end
            # Get the obtained Currency instance
            currency = field.currency
            unless currency.nil?
              # Get the RoundingOption of the Currency
              print "\nField Currency RoundingOption: "
              # Get the Precision of the Currency
              print currency.rounding_option
              unless currency.precision.nil?
                print "\nField Currency Precision:"
                print currency.precision
              end
            end
            # Get the ID of each Field
            print "\nField ID: "
            print field.id.to_s
            # Get if the Field is a CustomField
            unless field.custom_field
              print "\nField CustomField:"
              print field.custom_field
            end
            lookup = field.lookup
            unless lookup.nil?
              # Get the obtained Layout instance
              layout = lookup.layout
              # Check if layout is not null
              unless layout.nil?
                # Get the ID of the Layout
                print "\nField ModuleLookup Layout ID: "
                print layout.id.to_s
                # Get the Name of the Layout
                print "\nField ModuleLookup Layout Name: "
                print layout.name
              end
              # Get the DisplayLabel of the Module
              print "\nField ModuleLookup DisplayLabel: "
              print lookup.display_label
              # Get the APIName of the Module
              print "\nField ModuleLookup APIName: "
              print lookup.api_name
              # Get the Module of the ModuleLookup
              print "\nield ModuleLookup Module:  "
              print lookup.module
              unless lookup.id.nil?
                # Get the ID of the Module
                print "\nField ModuleLookup ID:"
              end
            end
            unless field.visible.nil?
              # Get the Visible of each Field'
              print "\nField Visible: "
              print field.visible
            end
            unless field.length.nil?
              # Get the Length of each Field
              print "\nField Length: "
              print field.length
            end
            view_type = field.view_type
            unless view_type.nil?
              # Get the View of the ViewType
              print "\nField ViewType View: "
              print view_type.view
              # Get the Edit of the ViewType
              print "\nField ViewType Edit: "
              print view_type.edit
              # Get the Create of the ViewType
              print "\nField ViewType Create: "
              print view_type.create
              # Get the QuickCreate of the ViewType
              print "\nField ViewType QuickCreate: "
              print view_type.quick_create
            end
            subform = field.subform
            unless subform.nil?
              # Get the obtained Layout instance
              layout = subform.layout
              # Check if layout is not null
              unless layout.nil?
                # Get the ID of the Layout
                print "\nField Subform Layout ID: "
                print layout.id.to_s
                # Get the ID of the Layout
                print "\nField Subform Layout Name: "
                print layout.name
              end
              # Get the DisplayLabel of the Module
              print "\nField Subform DisplayLabel: "
              print subform.display_label
              # Get the APIName of the Module
              print "\nField Subform APIName: "
              print subform.api_name
              # Get the Module of the ModuleLookup
              print "\nField Subform Module: "
              print subform.module
              unless subform.id.nil?
                # Get the ID of the Module
                print "\nField Subform ID: "
                print subform.id.to_s
              end
            end
            # Get the APIName of each Field
            print "\nField APIName: "
            print field.api_name
            # Get the obtained Unique instance
            unique = field.unique
            unless unique.nil?
              # Get the Casesensitive of the Unique
              print "\nField Unique Casesensitive : "
              print unique.casesensitive
            end
            if field.history_tracking.nil?
              # Get the HistoryTracking of each Field
              print "\nField HistoryTracking: "
              print field.history_tracking
            end
            # Get the DataType of each Field
            print "\nField DataType: "
            print field.data_type
            # Get the Object obtained Formula instance
            formula = field.formula
            # Check if formula is not null
            unless formula.nil?
              # Get the ReturnType of the Formula
              print "\nField Formula ReturnType : "
              print formula.return_type
              # Get the Expression of the Formula
              unless formula.expression.nil?
                print "\nField Formula Expression : "
                print formula.expression
              end
            end
            unless field.decimal_place.nil?
              # Get the DecimalPlace of each Field
              print "\nField DecimalPlace: "
              print field.decimal_place
            end
            # Get the MassUpdate of each Field
            print "\nField MassUpdate: "
            print field.mass_update
            unless field.blueprint_supported.nil?
              # Get the BlueprintSupported of each Field
              print "\nField BlueprintSupported: "
              print field.blueprint_supported
            end
            # Check if multiSelectLookup is not None
            multi_select_lookup = field.multiselectlookup
            unless multi_select_lookup.nil?
              # Get the DisplayValue of the MultiSelectLookup
              print "\n DisplayLabel:"
              print multi_select_lookup.display_label
              # Get the LinkingModule of the MultiSelectLookup
              print "\n LinkingModule:"
              print multi_select_lookup.linking_module
              # Get the LookupApiname of the MultiSelectLookup
              print "\n LookupApiname:"
              print multi_select_lookup.lookup_apiname
              # Get the APIName of the MultiSelectLookup
              print "\n APIName:"
              print multi_select_lookup.api_name
              # Get the ConnectedlookupApiname of the MultiSelectLookup
              print "\n ConnectedlookupApiname:"
              print multi_select_lookup.connectedlookup_apiname
              # Get the ID of the MultiSelectLookup
              print "\n ID:"
              print multi_select_lookup.id.to_s
            end
            pick_list_values = field.pick_list_values
            # Get the DisplayValue of each PickListValue
            # Get the SequenceNumber of each PickListValue
            # Get the ExpectedDataType of each PickListValue
            # Get the ActualValue of each PickListValue
            # Get the SysRefName of each PickListValues
            # Get the Type of each PickListValues
            pick_list_values&.each do |pick_list_value|
              # Get the DisplayValue of each PickListValue
              print "\nField PickListValue DisplayValue: "
              print pick_list_value.display_value
              # Get the SequenceNumber of each PickListValue
              print "\nField PickListValue SequenceNumber:: "
              print pick_list_value.sequence_number unless pick_list_value.sequence_number.nil?
              # Get the ExpectedDataType of each PickListValue
              print "\nField PickListValue ExpectedDataType: "
              print pick_list_value.expected_data_type
              pick_list_value.maps&.each do |map|
                print map
              end
              # Get the ActualValue of each PickListValue
              print "\nField PickListValue ActualValue: "
              print pick_list_value.actual_value
              # Get the SysRefName of each PickListValues
              print "\nField PickListValue SysRefName: "
              print pick_list_value.sys_ref_name
              # Get the Type of each PickListValues
              print "\nField PickListValue Type: "
              print pick_list_value.type
            end
            # Check if autoNumber is not None
            auto_number = field.auto_number
            unless auto_number.nil?
              # Get the Prefix of the AutoNumber
              print "\nField AutoNumber Prefix: "
              print auto_number.prefix
              # Get the Suffix of the AutoNumber
              print "\nField AutoNumber Suffix: "
              print auto_number.suffix
              # Get the StartNumber of the AutoNumber
              unless auto_number.start_number.nil?
                print "\nField AutoNumber StartNumber: "
                print auto_number.start_number
              end
            end
            default_value = field.default_value
            unless default_value.nil?
              # Get the DefaultValue of each Field
              print "\nField DefaultValue"
              print default_value
            end
            section_id = field.section_id
            unless section_id.nil?
              # Get the SectionId of each Field
              print "\nField SectionId: "
              print section_id
            end
            # Check if ValidationRule is not None
            validation_rule = field.validation_rule
            # Get the validationRule dict
            validation_rule&.each do |k, v|
              print "\n"
              print k
              print v
              print "\n"
            end
            # Check if ConvertMapping is not None
            # Get the validationRule dict
            field.convert_mapping&.each do |k, v|
              print "\n"
              print k
              print v
              print "\n"
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Fields::APIException
          exception = response_handler
          # Get the Code
          print "\ncode:"
          print exception.code.value
          # Get the Status
          print "\n status:"
          print exception.status.value
          # Get the Message
          print "\n message:"
          print exception.message.value
          # Get the details map
          exception.details.each do |k, v|
            print "\n"
            print k
            print v
            print "\n"
          end
          print "\n"
        end
      elsif status_code != 204
        response_object = response.data_object
        response_object.instance_variables.each do |field|
          print field
          print "\n"
          print response_object.instance_variable_get(field)
        end
      end
    end
  end
end
