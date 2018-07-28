{% if pretext %}
<!--Pretext-->
<div>
	{{ pretext }}
</div>
{% endif %}
<form action="{{ action }}" method="post" id="jkAffiliateForm">
	{% if payment_fields %}
	<!--Payment fields-->
	<fieldset>
		<legend>{{ payment_title }}</legend>
		{% for payment in payment_fields %}
		<div style="float: left; width: 100%;"{% if payment.showon %} data-showon='{{ payment.showon }}'{% endif %}>
			<label class="radio">
				<input
					type="radio"
					name="jk_payment"
					id="{{ payment.name }}"
					value="{{ payment.name }}"
					{% if payment.default %} checked{% endif %}
				>
				<strong>{{ payment.label }}</strong>
				{% if payment.logo %}
				<div style="margin-left: 44px;">
					<img src="{{ payment.logo }}" alt="{{ payment.name }}" />
				</div>
				{% endif %}
				{% if payment.tooltip %}
				<div style="margin-left: 44px;">
					<em>{{ payment.tooltip }}</em>
				</div>
				{% endif %}
			</label>
			{% if payment_add_fields %}
				<!--Additional fields for payment-->
				{% for field in payment_add_fields %}
					{% if field.payment == payment.name %}
						{% case field.type %}
							{% when 'text' %}
								{% include 'html/forms/field_text' %}
							{% when 'textarea' %}
								{% include 'html/forms/field_textarea' %}
							{% when 'select' %}
								{% include 'html/forms/field_select' %}
							{% when 'radio' %}
								{% include 'html/forms/field_radio' %}
							{% when 'checkbox' %}
								{% include 'html/forms/field_checkbox' %}
							{% when 'calendar' %}
								{% include 'html/forms/field_calendar' %}
						{% endcase %}
					{% endif %}
				{% endfor %}
			{% endif %}
		</div>
		{% endfor %}
	</fieldset>
	{% endif %}
	{% if contacts_fields %}
	<!--Contacts fields-->
	<fieldset>
		<legend>{{ contacts_title }}</legend>
		{% for field in contacts_fields %}
			{% case field.type %}
				{% when 'firstname' %}
					{% include 'html/forms/field_text' %}
				{% when 'middlename' %}
					{% include 'html/forms/field_text' %}
				{% when 'lastname' %}
					{% include 'html/forms/field_text' %}
				{% when 'email' %}
					{% include 'html/forms/field_email' %}
				{% when 'phone' %}
					{% include 'html/forms/field_tel' %}
				{% when 'location' %}
					{% include 'html/forms/field_location' %}
				{% when 'address1' %}
					{% include 'html/forms/field_text' %}
				{% when 'address2' %}
					{% include 'html/forms/field_text' %}
				{% when 'postal_code' %}
					{% include 'html/forms/field_text' %}
				{% when 'website' %}
					{% include 'html/forms/field_url' %}
				{% when 'aboutme' %}
					{% include 'html/forms/field_textarea' %}
				{% when 'dob' %}
					{% include 'html/forms/field_calendar' %}
				{% when 'text' %}
					{% include 'html/forms/field_text' %}
				{% when 'textarea' %}
					{% include 'html/forms/field_textarea' %}
				{% when 'select' %}
					{% include 'html/forms/field_select' %}
				{% when 'radio' %}
					{% include 'html/forms/field_radio' %}
				{% when 'checkbox' %}
					{% include 'html/forms/field_checkbox' %}
				{% when 'mail' %}
					{% include 'html/forms/field_email' %}
				{% when 'tel' %}
					{% include 'html/forms/field_tel' %}
				{% when 'url' %}
					{% include 'html/forms/field_url' %}
				{% when 'calendar' %}
					{% include 'html/forms/field_calendar' %}
			{% endcase %}
		{% endfor %}
	</fieldset>
	{% endif %}
	{% if rules %}
	<!--Shop rules-->
	<label class="checkbox">
		{{ 'behavior.modal' | jhtml: '#jk-modal_rules' }}
		<input type="checkbox" id="jk_rules" name="jk_rules" value="1">
		<a href="#jk-body_rules" id="jk-modal_rules" rel="{size: {x:550, y:330}}">
			{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_CHECK_RULES' }}
		</a>
		<div style="display:none">
			<div id="jk-body_rules">
				<h2>
					{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_RULES' }}
				</h2>
				{{ rules }}
			</div>
		</div>
	</label>
	{% endif %}
	<input type="submit" data-click="affiliate-form" class="button" value="{{ '_' | jtext: 'JSAVE' }}">
</form>
{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}