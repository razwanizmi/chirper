# frozen_string_literal: true

ActionView::Base.field_error_proc = proc do |html_tag, instance|
  if html_tag =~ /type="hidden"/ || html_tag =~ /<label/
    html_tag
  else
    puts html_tag.insert(html_tag[/\A<\w+/].length, " aria-invalid=true")

    %(
      #{html_tag.insert(html_tag[/\A<\w+/].length, " aria-invalid=true")}
      <small style="color:#b71c1c">
        #{[instance.error_message].flatten.first}
      </small>
    ).html_safe
  end
end
