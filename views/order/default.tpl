{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'behavior.tabstate' | jhtml }}

<!--Header-->
{% if heading %}
<h1>{{ heading }}</h1>
{% else %}
<h2>{{ title }}</h2>
{% endif %}

<!--Order-->
<div>
  {{ order }}
</div>

{% if cart_empty %}
  <!--Cart empty-->
  <div>
    <h4>{{ '_' | jtext: 'COM_JKASSA_CART_EMPTY_TITLE' }}!</h4>
    <p>
      {% if user_guest %}
      {{ 'sprintf' | jtext: 'COM_JKASSA_CART_EMPTY_NOTE_GUEST', login_url }}
      {% else %}
      {{ '_' | jtext: 'COM_JKASSA_CART_EMPTY_NOTE' }}
      {% endif %}
    </p>
  </div>
{% else %}
  
  {% capture access_note %}
    {% if access_form %}
    <!--You do not have access-->
    <div>
      <h4>{{ '_' | jtext: 'JGLOBAL_AUTH_ACCESS_GRANTED'  }}</h4>
      <p>{{ '_' | jtext: 'COM_JKASSA_ORDER_FORM_ACCESS' }}</p>
    </div>
    {% endif %}
  {% endcapture %}
  
  {% capture limit_note %}
    {% if limit_order %}
    <!--Minimum order amount-->
    <div>
      {% capture limit_cost %}{{ limit_order | costDisplay }}{{ currency.symbol }}{% endcapture %}
      <h4>{{ 'sprintf' | jtext: 'COM_JKASSA_LIMIT_ORDER', limit_cost  }}</h4>
      <p>{{ '_' | jtext: 'COM_JKASSA_LIMIT_ORDER_NOTE' }}</p>
    </div>
    {% endif %}
  {% endcapture %}
  
  <div>
    {% if user_guest %}
      <ul class="tabs" id="orderTab">
        <li class="active">
          <a href="#new_user" data-toggle="tab">
            {{ '_' | jtext: 'COM_JKASSA_ORDER_NEW_USER' }}
          </a>
        </li>
        <li>
          <a href="#client" data-toggle="tab">
            {{ '_' | jtext: 'COM_JKASSA_ORDER_REGULAR_CLIENT' }}
          </a>
        </li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="new_user">
          {{ access_note }}{{ limit_note }}
          <!--Order form-->
          {{ form }}
        </div>
        <div class="tab-pane" id="client">
          <!--Login form-->
          {{ login_form }}
        </div>
      </div>
    {% else %}
      {{ access_note }}{{ limit_note }}
      <!--Order form-->
      {{ form }}
    {% endif %}
  </div>
{% endif %}

<!--Button: 'Continue Shopping'-->
<p class="text-center">
  <a class="button" href="{{ home_page }}">
    {{ '_' | jtext: 'COM_JKASSA_CART_CONTINUE_SHOPPING' }}
  </a>
</p>