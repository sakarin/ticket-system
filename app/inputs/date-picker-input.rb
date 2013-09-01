#class DatePickerInput < SimpleForm::Inputs::Base
#  def input
#    input_html_options.merge!(:value =>
#                                  I18n.l(@builder.object.send(attribute_name) || Time.now.to_date, :format => :input),
#                              :data => { :date_format => I18n.t('date.picker_format')}
#    )
#    "#{@builder.text_field(attribute_name, input_html_options )}".html_safe
#  end
#end