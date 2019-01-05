{{ 'stylesheet' | jhtml: 'css/style.css' }}

<div id="jk-wishlist-module" class="{{ class_sfx }}">
	{% if image %}
	<!--Wishlist image-->
	<p class="text-center">
	  <a href="{{ url_wishlist }}">
		<img alt="wishlist" src="{{ image }}" title="{{ image_title }}">
	  </a>
	</p>
	{% endif %}

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
		<a href="#" data-click="remove-wishlist" data-index="{{ product.index }}" class="" title="{{ '_' | jtext: 'MOD_JKASSA_WISHLIST_REMOVE' }}">
		  <small>{{ '_' | jtext: 'JACTION_DELETE' }}</small>
		</a>
	  </li>
	  {% endfor %}
	</ol>
	{% else %}
	  {% if text_empty %}
	  <!--Text empty wishlist-->
	  <p>
		{{ text_empty }}
	  </p>
	  {% endif %}
	{% endif %}
</div>