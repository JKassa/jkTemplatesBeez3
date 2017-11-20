{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}

<!--Header-->
{% if heading %}
<h1>{{ heading }}</h1>
{% else %}
<h2>{{ title }}</h2>
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

<!--Print-->
<ul class="actions">
  {% if print_screen == 0 %}
  <li class="print-icon">
    {{ print_icon }}
  </li>
  {% else %}
  <li class="print-icon">
    {{ print_screen }}
  </li>
  {% endif %}
</ul>

<div class="text-center">
  {% if print_screen == 0 %}
  <img src="{{ image }}" alt="action" />
  {% endif %}
  
  <h1>{{ order_status }}</h1>
  <p>{{ description }}</p>
  
  {% if print_screen == 0 and action == 'pending' %}
  <a href="{{ update_url }}" class="button">
    {{ '_' | jtext: 'COM_JKASSA_UPDATE_STATUS' }}
  </a>
  {% endif %}
  
  <hr />
  
  <h3>
    {{ 'sprintf' | jtext: 'COM_JKASSA_RESULT_NUMBER', pm_number }}
  </h3>
</div>

{% if note %}
<p>
  {{ note }}
</p>
{% endif %}

{% if print_screen == 0 %}
  <!--Order-->
  {% assign options = 'active' | arrayCombine: 'data_products' %}
  {{ 'sliders.start' | jhtml: 'resultAccordian', options }}
    <!--Information about order-->
    {% assign title_slide = '_' | jtext: 'COM_JKASSA_YOUR_PURCHASES' %}
    {{ 'sliders.panel' | jhtml: title_slide, 'data_products' }}
      {% include 'views/result/products' %}
    <!--Order data-->
    {% assign title_slide = '_' | jtext: 'COM_JKASSA_ORDER_DATA' %}
    {{ 'sliders.panel' | jhtml: title_slide, 'data_payment' }}
      {% include 'views/result/payment' %}
    <!--Data buyer-->
    {% assign title_slide = '_' | jtext: 'COM_JKASSA_DATA_BUYER' %}
    {{ 'sliders.panel' | jhtml: title_slide, 'data_buyer' }}
      {% include 'views/result/buyer' %}
    {% if delivery %}
    <!--Data delivery-->
    {% assign title_slide = '_' | jtext: 'COM_JKASSA_DATA_DELIVERY' %}
    {{ 'sliders.panel' | jhtml: title_slide, 'data_delivery' }}
      {% include 'views/result/delivery' %}
    {% endif %}
  {{ 'sliders.end' | jhtml }}
  
  <!--Continue shopping-->
  <p class="text-center" style="margin-top: 1.5em;">
    <a class="button" href="{{ home_page }}">
      {{ '_' | jtext: 'COM_JKASSA_CART_CONTINUE_SHOPPING' }}
    </a>
  </p>
{% else %}
  <!--Print-->
  <h4>{{ '_' | jtext: 'COM_JKASSA_YOUR_PURCHASES' }}</h4>
  {% include 'views/result/products' %}
  <h4>{{ '_' | jtext: 'COM_JKASSA_ORDER_DATA' }}</h4>
  {% include 'views/result/payment' %}
  <h4>{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER' }}</h4>
  {% include 'views/result/buyer' %}
  {% if delivery %}
  <h4>{{ '_' | jtext: 'COM_JKASSA_DATA_DELIVERY' }}</h4>
  {% include 'views/result/delivery' %}
  {% endif %}
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}