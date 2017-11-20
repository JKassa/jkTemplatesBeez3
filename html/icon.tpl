{% case icon %}
	{% when 'print' %}
		{{ 'image' | jhtml: 'system/printButton.png', 'print', '', 1 }}
        {{ '_' | jtext: 'JGLOBAL_PRINT' }}
	{% when 'print_screen' %}
		{{ 'image' | jhtml: 'system/printButton.png', 'print', '', 1 }}
        {{ '_' | jtext: 'JGLOBAL_PRINT' }}
    {% when 'email' %}
		{{ 'image' | jhtml: 'system/emailButton.png', 'email', '', 1 }}
        {{ '_' | jtext: 'JGLOBAL_EMAIL' }}
	{% when 'lock' %}
		{{ 'image' | jhtml: 'system/checked_out.png', 'lock', '', 1 }}
        {{ '_' | jtext: 'JLIB_HTML_CHECKED_OUT' }}
    {% when 'close' %}
		{{ 'image' | jhtml: 'system/edit_unpublished.png', 'close', '', 1 }}
        {{ '_' | jtext: 'JGLOBAL_EDIT' }}
    {% when 'edit' %}
		{{ 'image' | jhtml: 'system/edit.png', 'edit', '', 1 }}
        {{ '_' | jtext: 'JGLOBAL_EDIT' }}
    {% when 'create' %}
		{{ 'image' | jhtml: 'system/new.png', 'create', '', 1 }}
        {{ '_' | jtext: 'JNEW' }}
	{% when 'help' %}
		<span title="{{ tooltip }}"><img alt="info" src="media/system/images/tooltip.png"></span>
	{% when 'star' %}
		{{ 'image' | jhtml: 'system/rating_star.png', 'star', '', 1 }}
	{% when 'star-empty' %}
		{{ 'image' | jhtml: 'system/rating_star_blank.png', 'star_blank', '', 1 }}
	{% when 'big-star' %}
		{{ 'image' | jhtml: 'system/rating_star.png', 'star', 'style="width: 16px"', 1 }}
	{% when 'big-star-empty' %}
		{{ 'image' | jhtml: 'system/rating_star_blank.png', 'star_blank', 'style="width: 16px"', 1 }}
	{% when 'status_success' %}
		{% capture url %}jktemplates/{{ '' | templateName }}/images/status_success.png{% endcapture %}
		{{ url }}
	{% when 'status_new' %}
		{% capture url %}jktemplates/{{ '' | templateName }}/images/status_new.png{% endcapture %}
		{{ url }}
	{% when 'status_process' %}
		{% capture url %}jktemplates/{{ '' | templateName }}/images/status_process.png{% endcapture %}
		{{ url }}
	{% when 'status_fail' %}
		{% capture url %}jktemplates/{{ '' | templateName }}/images/status_fail.png{% endcapture %}
		{{ url }}
{% endcase %}