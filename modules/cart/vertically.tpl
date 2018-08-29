{{ 'stylesheet' | jhtml: 'css/style.css' }}

<div id="jk-cart-module">
	{% if image %}
	<!--Cart image-->
	<p class="text-center">
	  <a href="{{ url_cart }}">
		<img alt="cart" src="{{ image }}" title="{{ image_title }}">
	  </a>
	</p>
	{% endif %}

	<!--Quantity-->
	<p class="text-center">
	  {% capture cart_quantity %}<strong>{{ quantity }}</strong>{% endcapture %}
	  {{ 'sprintf' | jtext: 'MOD_JKASSA_CART_COUNT', cart_quantity }}
	</p>

	{% if products %}
	<!--List products-->
	<ol>
	  {% for product in products %}
	  <li>
		<a href="{{ product.url }}">
		  {{ product.name }}
		</a>

		{% if product.variants %}
		<br>
		<small>
          {% for variant in product.variants %}
            {{ variant.name }}:
            {% if variant.type == 'color' or variant.type == 'texture' %}
			  {{ variant.title }}
			{% else %}
			  {{ variant.value }}
			{% endif %}
          {% endfor %}
        </small>
		{% endif %}

		<br>
		{% if product.old_cost %}
		<!--old cost-->
		<del>{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
		{% endif %}
		<!--cost-->
		<strong>{{ product.cost | costDisplay }}{{ currency.symbol }}</strong>
		<small>({{ product.quantity }})</small>
	  </li>
	  {% endfor %}
	</ol>

	<!--Cart total-->
	<p class="text-center">
	  {% capture cart_total %}<strong>{{ total | costDisplay }}{{ currency.symbol }}</strong>{% endcapture %}
	  {{ 'sprintf' | jtext: 'MOD_JKASSA_CART_AMOUNT', cart_total }}
	</p>

	<!--URL cart & order-->
	<p class="text-center">
	  <a href="{{ url_cart }}" class="button">
		{{ '_' | jtext: 'MOD_JKASSA_CART_YOUR_CART' }}
	  </a>
	  &nbsp;
	  <a href="{{ url_order }}" class="button">
		{{ '_' | jtext: 'MOD_JKASSA_CART_CART_ORDER' }}
	  </a>
	</p>
	{% else %}
	  {% if text_empty %}
	  <!--Text empty cart-->
	  <p>
		{{ text_empty }}
	  </p>
	  {% endif %}
	{% endif %}
</div>