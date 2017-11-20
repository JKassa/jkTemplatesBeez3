{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}

<h2>
  {{ orderform.name }}
</h2>

<div class="items-row cols-2">
  <div class="column-1">
    <img {{ image | img_exists: '104x150' }} alt="{{ alias }}" />
    {% if present %}
    <!--Share (Product as a present)-->
    <div class="share" title="{{ present.desc }}">
      <div class="sharetitle">
        {{ '_' | jtext: 'COM_JKASSA_GIFT' }}
      </div>
      <div class="sharedesc">
        <a href="{{ present.url }}" target="_top">
          <img {{ present.image | img_exists: '50x50' }} alt="{{ present.name }}">
        </a>
      </div>
    </div>
    {% endif %}
  </div>
  
  <div class="column-2">
    <h4>
      <a href="{{ url }}" target="_top">
        {{ name }}
      </a>
      
      {% if files %}
      <!--Files-->
      <span title="{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}: {{ product.files | join: ', ' }}">
        <img alt="info" src="media/system/images/new.png">
      </span>
      {% endif %}
    </h4>
    
    <!--SKU (code)-->
    <small>
      {{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ sku }}
    </small>
    
    {% if variants %}
    <!--Product variants-->
    <div>
      {% for variant in variants %}
        {{ variant.name }}: {{ variant.text }}
      {% endfor %}
    </div>
    {% endif %}
    
    <!--Cost-->
    <div class="cost">
      <!--old cost-->
      {% if old_cost %}
      <del>{{ old_cost }}{{ currency.symbol }}</del>
      {% endif %}
      <!--cost-->
      <span>{{ cost }}</span>{{ currency.symbol }}
	  {% if vat %}
	  <small>
		({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', vat }})
	  </small>
      {% endif %}
    </div>
  </div>
</div>

{% if access_form %}
<div>
  <h4>{{ '_' | jtext: 'JGLOBAL_AUTH_ACCESS_GRANTED'  }}</h4>
  <p>{{ '_' | jtext: 'COM_JKASSA_ORDER_FORM_ACCESS' }}</p>
</div>
{% else %}
<form action="{{ orderform.action }}" method="post" id="jkOrderForm">
  {% if orderform.contacts_fields %}
  <!--Contacts fields-->
  <fieldset>
    {% for field in orderform.contacts_fields %}
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
      {% endcase %}
    {% endfor %}
  </fieldset>
  {% endif %}
  <input type="hidden" value="jk_payment_quickorder" name="jk_payment">
  <input type="submit" data-click="order-form" value="{{ '_' | jtext: 'COM_JKASSA_SEND_ORDER' }}">
</form>

<p id="jkOrderAlert" style="display: none;">
  {{ '_' | jtext: 'COM_JKASSA_ORDER_NOTICE' }}
</p>
{% endif %}