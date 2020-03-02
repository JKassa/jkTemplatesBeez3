{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'bootstrap.tooltip' | jhtml }}
{% assign options = 'disable_search_threshold' | arrayCombine: 20 %}
{{ 'formbehavior.chosen' | jhtml: 'select', null, options }}

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

<!--Profile-->
{{ profile }}

<!--Nav-->
<ul>
  {% if guest %}
  {{ 'behavior.modal' | jhtml: '#jk-modal_login' }}
  <li>
    <a href="{{ login_url }}" id="jk-modal_login" rel="{handler: 'iframe', size: {x:768, y:430}}">
      {{ '_' | jtext: 'JLOGIN' }}
    </a>
  </li>
  {% endif %}
  {% if allow_registration %}
  <li>
    <a href="{{ registration_route }}">
      {{ '_' | jtext: 'JREGISTER' }}
    </a>
  </li>
  {% endif %}
  <li>
    {{ 'behavior.modal' | jhtml: '#jk-modal_cart' }}
    <a href="{{ cart_url }}" id="jk-modal_cart" rel="{handler: 'iframe', size: {x:768, y:430}}">
      {{ '_' | jtext: 'COM_JKASSA_YOUR_CART' }} ({{ cart_quantity }})
    </a>
  </li>
  <li>
    {{ 'behavior.modal' | jhtml: '#jk-modal_viewed' }}
    <a href="{{ viewed_url }}" id="jk-modal_viewed" rel="{handler: 'iframe', size: {x:768, y:430}}">
      {{ '_' | jtext: 'COM_JKASSA_VIEWED' }} ({{ viewed_quantity }})
    </a>
  </li>
  <li>
    {{ 'behavior.modal' | jhtml: '#jk-modal_wishlist' }}
    <a href="{{ wishlist_url }}" id="jk-modal_wishlist" rel="{handler: 'iframe', size: {x:768, y:430}}">
      {{ '_' | jtext: 'COM_JKASSA_YOUR_WISHLIST' }} ({{ wishlist_quantity }})
    </a>
  </li>
  <li>
    {{ 'behavior.modal' | jhtml: '#jk-modal_compare' }}
    <a href="{{ compare_url }}" id="jk-modal_compare" rel="{handler: 'iframe', size: {x:768, y:430}}">
      {{ '_' | jtext: 'COM_JKASSA_COMPARE_PRODUCTS' }} ({{ compare_quantity }})
    </a>
  </li>
  {% if guest != 1 %}
  <li>
    {{ 'behavior.modal' | jhtml: '#jk-modal_orders' }}
    <a href="{{ orders_url }}" id="jk-modal_orders" rel="{handler: 'iframe', size: {x:768, y:430}}">
      {{ '_' | jtext: 'COM_JKASSA_YOUR_ORDERS' }} ({{ orders_quantity }})
    </a>
  </li>
  {% endif %}
  {% if guest != 1 %}
  <li>
    {{ 'behavior.modal' | jhtml: '#jk-modal_reviews' }}
    <a href="{{ reviews_url }}" id="jk-modal_reviews" rel="{handler: 'iframe', size: {x:768, y:430}}">
      {{ '_' | jtext: 'COM_JKASSA_YOUR_REVIEWS' }} {{ reviews_quantity }}
    </a>
  </li>
  {% endif %}
  {% if affiliate %}
  <li>
	{{ 'behavior.modal' | jhtml: '#jk-modal_affiliate' }}
	<a href="{{ affiliate_url }}" id="jk-modal_affiliate" rel="{handler: 'iframe', size: {x:768, y:430}}">
	  {{ '_' | jtext: 'COM_JKASSA_AFFILIATE_PROGRAM' }}
	</a>
  </li>
  {% endif %}
</ul>

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}