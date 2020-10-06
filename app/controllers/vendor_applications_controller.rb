class VendorApplicationsController < VendorsController
  include Wicked::Wizard
   
  steps :welcome, :general_information, :company_details, :management_details, :gst_details, :statutory_details, :bank_details, :thank_you
   
  def show
    @application = current_user.vendor_application.present? ? current_user.vendor_application : VendorApplication.create({user_id: current_user.id})
    session[:va] = @application.id
    
    if @application.is_submitted_for_approval? && (@application.is_approved_by_first_level.nil? || @application.is_approved_by_second_level.nil?)
      flash[:error] = "Your Application is under review, we will get back to you soon!"
      return redirect_to vendors_path
    end

    case step
    when :general_information
      @form_data = @application.general_information || GeneralInformation.new(vendor_application_id: @application.id)
    when :company_details
      @form_data = @application.company_information || CompanyInformation.new(vendor_application_id: @application.id)
    when :management_details
      @form_data = @application.management_information || ManagementInformation.new(vendor_application_id: @application.id)
    when :gst_details
      @form_data = @application.gst_info || GstInfo.new(vendor_application_id: @application.id)
    when :statutory_details
      @form_data = @application.statutory_detail || StatutoryDetail.new(vendor_application_id: @application.id)
    when :bank_details
      @form_data = @application.bank_detail || BankDetail.new(vendor_application_id: @application.id)
    end
    render_wizard
  end
   
  def update
    application = VendorApplication.find(session[:va])
    application.update(current_step: step)
    case step
    when :general_information
      perform_general_information
    when :company_details
      perform_company_details
    when :management_details
      perform_management_details
    when :gst_details
      perform_gst_details
    when :statutory_details
      perform_statutory_details
    when :bank_details
      perform_bank_details
    end
  end
   
  private
   
   def perform_general_information
     if general_information_params[:id].present?
       gm = GeneralInformation.find(general_information_params[:id])
       if gm.update(general_information_params)
         redirect_to next_wizard_path
       else
         flash[:error] = gm.errors.full_messages.join("</br>")
         redirect_to jump_to(step)
       end
     else
       gm = GeneralInformation.new(general_information_params)
       if gm.save
         redirect_to next_wizard_path
       else
         flash[:error] = gm.errors.full_messages.join("</br>")
         redirect_to jump_to(step)
       end
     end
   end
   
   def perform_company_details
     if company_information_params[:id].present?
       cm = CompanyInformation.find(company_information_params[:id])
       if cm.update(company_information_params)
         redirect_to next_wizard_path
       else
         flash[:error] = cm.errors.full_messages.join("</br>")
         redirect_to jump_to(step)
       end
     else
       cm = CompanyInformation.new(company_information_params)
       if cm.save
         redirect_to next_wizard_path
       else
         flash[:error] = cm.errors.full_messages.join("</br>")
         redirect_to jump_to(step)
       end
     end
   end
   
   def perform_management_details
     if management_information_params[:id].present?
       mi = ManagementInformation.find(management_information_params[:id])
       if mi.update(management_information_params)
         redirect_to next_wizard_path
       else
         flash[:error] = mi.errors.full_messages.join("</br>")
         redirect_to jump_to(step)
       end
     else
       mi = ManagementInformation.new(management_information_params)
       if mi.save
         redirect_to next_wizard_path
       else
         flash[:error] = mi.errors.full_messages.join("</br>")
         redirect_to jump_to(step)
       end
     end
   end
   
   def perform_gst_details
     if gst_params[:id].present?
       gst_info = GstInfo.find(gst_params[:id])
       if gst_info.update(gst_params)
         redirect_to next_wizard_path
       else
         flash[:error] = gst_info.errors.full_messages.join("</br>")
         redirect_to jump_to(step)
       end
     else
       gst_info = GstInfo.new(gst_params)
       if gst_info.save
         redirect_to next_wizard_path
       else
         flash[:error] = gst_info.errors.full_messages.join("</br>")
         redirect_to jump_to(step)
       end
     end
   end
   
   def perform_statutory_details
     if statutory_params[:id].present?
       sd = StatutoryDetail.find(statutory_params[:id])
       if sd.update(statutory_params)
         redirect_to next_wizard_path
       else
         flash[:error] = sd.errors.full_messages.join("</br>")
         redirect_to jump_to(step)
       end
     else
       sd = StatutoryDetail.new(statutory_params)
       if sd.save
         redirect_to next_wizard_path
       else
         flash[:error] = sd.errors.full_messages.join("</br>")
         redirect_to jump_to(step)
       end
     end
   end
   
   def perform_bank_details
     if bank_details_prams[:id].present?
       bd = BankDetail.find(bank_details_prams[:id])
       if bd.update(bank_details_prams)
         redirect_to next_wizard_path
       else
         flash[:error] = bd.errors.full_messages.join("</br>")
         redirect_to jump_to(step)
       end
     else
       bd = BankDetail.new(bank_details_prams)
       if bd.save
         redirect_to next_wizard_path
       else
         flash[:error] = bd.errors.full_messages.join("</br>")
         redirect_to jump_to(step)
       end
     end
   end
   
   def general_information_params
     params.require(:general_information).permit(:id, :vendor_type, :vendor_sub_type, :nature_of_the_entity, :annual_sales, :list_of_products, :correspondence_address_line_1, :correspondence_address_line_2, :correspondence_city, :correspondence_state, :correspondence_country, :correspondence_pin_code, :shipping_address_line_1, :shipping_address_line_2, :shipping_city, :shipping_state, :shipping_country, :shipping_pin_code, :office_address_line_1, :office_address_line_2, :office_city, :office_state, :office_country, :office_pin_code, :vendor_application_id)
   end
   
   def company_information_params
     params.require(:company_information).permit(:company_presentation, :company_presentation_doc, :credit_rating, :credit_rating_doc, :product_catelogue, :product_catelogue_doc, :manufactoring_facilities, :manufactoring_facilities_doc, :quality_assurance_plan, :quality_assurance_plan_doc, :iso_9001, :iso_9001_doc, :iso_14000, :iso_14000_doc, :ohsas, :ohsas_doc, :iso_27000_doc, :iso_27000, :indian_boiler_regulations, :indian_boiler_regulations_doc, :asme, :asme_doc, :pressure_equipment_directive, :pressure_equipment_directive_doc, :underwriters_labs, :underwriters_labs_doc, :customer_approval, :customer_approval_doc, :sample_test, :sample_test_doc, :customer_reference, :customer_reference_doc, :incorporation_certificate, :incorporation_certificate_doc, :legal_cases, :legal_cases_doc, :annual_turnover, :annual_turnover_doc, :vendor_application_id, :id)
   end
   
   def management_information_params
      params.require(:management_information).permit(:key_contact, :name, :designation, :landline, :mobile, :email, :pan_card, :aadar_card, :vendor_application_id, :id)
   end
   
   def gst_params
     params.require(:gst_info).permit(:pan_card, :pan_card_doc, :is_organization_registered, :is_gst_exempted, :is_turonover_below_par, :gst_no, :registered_email, :address_line_1, :address_line_2, :state, :pin_code, :vendor_application_id, :id)
   end
   
   def statutory_params
     params.require(:statutory_detail).permit(:service_tax_no, :service_tax_no_doc, :esic_no, :esic_no_doc, :vat_tin_no, :vat_tin_no_doc, :cst_tin_no, :cst_tin_no_doc, :pf_no, :pf_no_doc, :labour_license_no, :labour_license_no_doc, :is_covered_under_msme, :msme_registered_date, :msme_type, :ca_certificate, :vendor_application_id, :id)
   end
   
   def bank_details_prams
     params.require(:bank_detail).permit(:account_number, :account_type, :bank_name, :bank_code, :branch_name, :bank_address, :ifsc_code, :canceled_cheque, :vendor_application_id, :id)
   end
  
end