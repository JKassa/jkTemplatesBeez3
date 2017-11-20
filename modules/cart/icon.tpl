{{ 'stylesheet' | jhtml: 'css/style.css' }}

{% if products %}
  {% assign background = '337ab7' %}
{% else %}
  {% assign background = '999999' %}
{% endif %}

<div id="jk-cart-module">
	<a id="jk-cart-module" href="{{ url_cart }}" style=" display: block; position: relative; width: 30px;height: 30px" title="{{ image_title }}">
	  <span style="display: block; margin-top: 5px">
		<img alt="cart" src="{{ image }}">
	  </span>
	  <span style="top: -5px; right: -10px; position: absolute">
		<span style="padding: 2px 9px; border-radius: 9px; font-size: 11.844px; font-weight: bold; line-height: 14px; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #ffffff; background-color: #{{ background }}">{{ quantity }}</span>
	  </span>
	</a>
</div>