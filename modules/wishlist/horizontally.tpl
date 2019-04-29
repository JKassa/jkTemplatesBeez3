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
	<div class="block-products">
	  <ul class="items-row cols-3">
		{% assign rowcount = 0 %}
		{% for product in products %}
		  {% assign rowcount = rowcount | plus: 1 %}
		  <li class="item column-{{ rowcount }}">
			<div class="article-info">
			  <div class="product-image">
				{% if product.stickers %}
				<!-- Stickers -->
				<ul class="stickers">
				  {% if product.new %}
				  <li>
					<span class="product-label product-label_new">NEW</span>
				  </li>
				  {% endif %}
				  {% if product.hit %}
				  <li>
					<span class="product-label product-label_hit">HIT</span>
				  </li>
				  {% endif %}
				  {% if product.discount %}
				  <li>
					{% if product.discount_image %}
					<img {{ product.discount_image | img_exists: '30x30' }} alt="{{ product.discount }}" title="{{ product.discount_desc }} - {{ product.discount }}">
					{% else %}
					<span class="product-label" title="{{ product.discount_desc }} - {{ product.discount }}">-{{ product.discount }}</span>
					{% endif %}
				  </li>
				  {% endif %}
				</ul>
				{% endif %}

				{% if product.manufacturer %}
				<!--Manufacturer name and miniature-->
				<div class="manufacturer">
				  <img {{ product.manufacturer.thumbnail | img_exists: '30x30' }} alt="{{ product.manufacturer.alias }}" title="{{ product.manufacturer.name }}">
				</div>
				{% endif %}

				<!--Product Image-->
				<div class="text-center">
				  <a href="{{ product.url }}">
					<img {{ product.image | img_exists: '104x150' }} alt="{{ product.alias }}" />
				  </a>
				</div>

				{% if product.present %}
				<!--Share (Product as a present)-->
				<div class="share" title="{{ product.present.desc }}">
				  <div class="sharetitle">
					{{ '_' | jtext: 'COM_JKASSA_GIFT' }}
				  </div>
				  <div class="sharedesc">
					<a href="{{ product.present.url }}">
					  <img {{ product.present.image | img_exists: '50x50' }} alt="{{ product.present.name }}">
					</a>
				  </div>
				</div>
				{% endif %}
			  </div>
			  <div class="caption">
				<!--Name and URL of the product-->
				<h4>
				  <a href="{{ product.url }}" title="{{ product.name }}">
					{{ product.name }}
				  </a>

				  {% if product.files %}
					<!--Files-->
					<span title="{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}: {{ product.files | join: ', ' }}">
					  <img alt="info" src="media/system/images/new.png">
					</span>
				  {% endif %}
				</h4>

				<!--Price the product-->
				<div>
				  {% if product.old_cost %}
				  <!--old cost-->
				  <del>{{ product.old_cost }}</del>
				  {% endif %}
				  <!--cost-->
				  <span class="cost">
					<span>{{ product.cost }}</span>{{ currency.symbol }}
				  </span>
				</div>

				<!--Stock-->
				<div class="text-right">
				  {% case product.stock %} 
				  {% when 0 %}
				  <!--Not available-->
				  {{ '_' | jtext: 'COM_JKASSA_STOCK_0' }}
				  {% when '-1' %}
				  <!--Available-->
				  {{ '_' | jtext: 'COM_JKASSA_STOCK_1' }}
				  {% when '-2' %}
				  <!--Under the order-->
				  {{ '_' | jtext: 'COM_JKASSA_STOCK_2' }}
				  {% else %}
				  <!--Number-->
				  {{ '_' | jtext: 'COM_JKASSA_STOCK' }}: {{ product.stock }}
				  {% endcase %}
				</div>

				{% comment %}
					Connecting voting plugin.
					See: Plugin Manager: Plugins -> jkvotes.
				{% endcomment %}
				{% assign votes = product.id | jkcountervotes: product.rating, product.rating_count %}
				{% if votes %}
				<!--Rating-->
				<div class="text-right">
				  {{ votes }}
				</div>
				{% endif %}

				{% if product.variants %}
				<!--Variants product-->
				<p>
				  {% for variant in product.variants %}
					{{ variant.name }}: {{ variant.title }}
				  {% endfor %}
				</p>
				{% endif %}

				<!--Remove from wishlist-->
				<p class="text-center">
				  <a href="#" data-click="remove-wishlist" data-index="{{ product.index }}" class="button" title="{{ '_' | jtext: 'MOD_JKASSA_WISHLIST_REMOVE' }}">
					{{ '_' | jtext: 'JACTION_DELETE' }}
				  </a>
				</p>
			  </div>
			</div>
		  </li>
		  {% if rowcount == 3 %}{% assign rowcount = 0 %}{% endif %}
		{% endfor %}
	  </ul>
	</div>
	{% else %}
	  {% if text_empty %}
	  <!--Text empty wishlist-->
	  <p>
		{{ text_empty }}
	  </p>
	  {% endif %}
	{% endif %}
</div>