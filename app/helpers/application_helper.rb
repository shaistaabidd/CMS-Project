module ApplicationHelper
  def status_tag(boolean)#, options={})
    #options[:true_text] || = ' '
    #options[:false_text] || = ' '
    #options[:true_text].errors.full_messages
    if boolean
      content_tag(:span,"" ,:class=> 'status true')
    else
      content_tag(:span, "", :class=> 'status false')
    end
  end
end
