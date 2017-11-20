{{ 'stylesheet' | jhtml: 'css/style.css' }}

<div id="jk-compare-module">
	{% if image %}
	<!--Compare image-->
	<p class="text-center">
	  <a href="{{ url_compare }}">
		<img alt="compare" src="{{ image }}" title="{{ image_title }}">
	  </a>
	</p>
	{% endif %}

	{% if categories %}
	<!--Categories-->
	{% for category in categories %}
	<div class="article-info">
	  <div class="caption">
		<a href="#" class="button" style="float:right" data-click="remove-compare-category" data-indexes="{{ category.indexes }}" title="{{ '_' | jtext: 'MOD_JKASSA_COMPARE_REMOVE' }}">&times;</a>
		<h4>
		  {{ category.title }}
		  <small>({{ 'plural' | jtext: 'MOD_JKASSA_COMPARE_PRODUCTS_QUANTITY', category.products_total }})</small>
		</h4>
		<ol>
		  {% for product in category.products %}
		  <li>
			<a href="{{ product.url }}" target="_top">{{ product.name }}</a>
			{% if product.variants %}
			  <!--Variants product-->
			  {% for variant in product.variants %}
				{{ variant.name }}: {{ variant.title }}
			  {% endfor %}
			{% endif %}
		  </li>
		  {% endfor %}
		</ol>
		{% if category.products_total == 1 %}
		<p>
		  <strong>
			{{ '_' | jtext: 'MOD_JKASSA_COMPARE_NOT_ENOUGH' }}
		  </strong>
		</p>
		{% else %}
		<p>
		  <a href="{{ category.url }}" class="button">
			{{ '_' | jtext: 'MOD_JKASSA_COMPARE_COMPARE' }}
		  </a>
		</p>
		{% endif %}
	  </div>
	</div>
	{% endfor %}
	{% else %}
	  {% if text_empty %}
	  <!--Text empty compare-->
	  <p>
		<strong>{{ text_empty }}</strong>
	  </p>
	  {% endif %}
	{% endif %}