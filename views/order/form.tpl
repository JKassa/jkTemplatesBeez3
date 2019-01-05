<!--Name form-->
<h3>
  {{ name }}
</h3>

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

<form action="{{ form_action }}" method="post" id="jkOrderForm">
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
  
  {% if delivery_fields %}
  <!--Delivery fields-->
  <fieldset id="jk-order-delivery">
    <legend>{{ delivery_title }}</legend>
    {% for delivery in delivery_fields %}
    <div style="float: left; width: 100%;"{% if delivery.showon %} data-showon='{{ delivery.showon }}'{% endif %}>
      <label class="radio">
        <input
          type="radio"
          name="jk_delivery"
          id="{{ delivery.name }}"
          value="{{ delivery.name }}"
          {% if delivery.default %} checked{% endif %}
         >
        <strong>{{ delivery.label }}</strong>
		{% if delivery.logo %}
        <div style="margin-left: 44px;">
          <img src="{{ delivery.logo }}" alt="{{ delivery.name }}" />
        </div>
        {% endif %}
        {% if delivery.cost != 0.00 %}
        <!--Cost of delivery-->
        <div style="margin-left: 44px;">
          {{ '_' | jtext: 'COM_JKASSA_COST_DELIVERY' }}:
		  <strong>{{ delivery.cost | costDisplay }}{{ currency.symbol }}</strong>
        </div>
        {% endif %}
        {% if delivery.free != 0.00 %}
        <!--Free delivery-->
        <div style="margin-left: 44px;">
          {{ '_' | jtext: 'COM_JKASSA_ORDER_FREE_DELIVERY' }}
		  <strong>{{ delivery.free | costDisplay }}{{ currency.symbol }}</strong>
        </div>
        {% endif %}
        {% if delivery.tooltip %}
        <!--Description delivery-->
        <div style="margin-left: 44px;">
          {{ delivery.tooltip }}
        </div>
        {% endif %}
      </label>
	  
	  {% if delivery_add_fields %}
        <!--Additional fields for delivery-->
        {% for field in delivery_add_fields %}
		  {% if field.delivery == delivery.name %}
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
			  {% when 'note' %}
                {% include 'html/forms/field_note' %}
            {% endcase %}
		  {% endif %}
        {% endfor %}
      {% endif %}
    </div>
    {% endfor %}
  </fieldset>
  {% endif %}
  
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
          {{ payment.tooltip }}
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
  
  {% if privacy %}
  <!--Privacy Policy-->
  <fieldset>
	<legend>{{ privacy.legend }}</legend>
	<div>
	  <p>{{ privacy.note }}</p>
	</div>
	<label for="jk_privacy">
	  {% if privacy.article %}
	  {{ 'behavior.modal' | jhtml }}
	  <a href="{{ privacy.article }}" class="modal" rel="{handler: 'iframe', size: {x:800, y:500}}">
		{{ privacy.label }}
	  </a>
	  {% else %}
	    {{ privacy.label }}
	  {% endif %}
	  <span class="star text-error">*</span>
	</label>
	<label class="radio">
	  <fieldset id="jk_privacy" class="required radio" required="required" aria-required="true" title="{{ privacy.desc }}">
	    <input id="jk_privacy0" name="jk_privacy" value="1" required="" aria-required="true" type="radio">
	    <label for="jk_privacy0">{{ privacy.agree }}</label>
	    <input id="jk_privacy1" name="jk_privacy" value="0" checked="checked" required="" aria-required="true" type="radio">
	    <label for="jk_privacy1">{{ '_' | jtext: 'JNO' }}</label>
	  </fieldset>
    </label>
  </fieldset>
  {% endif %}
  
  {% if rules %}
  <!--Shop rules-->
  <label class="checkbox">
    {{ 'behavior.modal' | jhtml: '#jk-modal_rules' }}
    <input type="checkbox" id="jk_rules" name="jk_rules" value="1">
    <a href="#jk-body_rules" id="jk-modal_rules" rel="{size: {x:550, y:330}}">
      {{ '_' | jtext: 'COM_JKASSA_ENABLEPROCESS' }}
    </a>
    <div style="display:none">
      <div id="jk-body_rules">
        <h2>
          {{ '_' | jtext: 'COM_JKASSA_SHOP_RULES' }}
        </h2>
        {{ rules }}
      </div>
    </div>
  </label>
  {% endif %}
  
  {% if captcha %}
  <!--CAPTCHA-->
  <div style="margin-top: 10px">
    {{captcha}}
  </div>
  {% endif %}
  
  <div style="margin-top: 10px">
    <input type="submit" data-click="order-form" class="button" value="{{ '_' | jtext: 'COM_JKASSA_SEND_ORDER' }}">
  </div>
</form>

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}