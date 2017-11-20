{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}

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

{% if categories %}
<!--Categories-->
{% for category in categories %}
<div class="article-info">
  <div class="caption">
    <a href="#" class="button" style="float:right" data-click="remove-compare-category" data-indexes="{{ category.indexes }}" title="{{ '_' | jtext: 'COM_JKASSA_COMPARE_DELETE_TITLE' }}">&times;</a>
    <h3>
      {{ category.title }}
      <small>({{ 'plural' | jtext: 'COM_JKASSA_PRODUCTS_QUANTITY', category.products_total }})</small>
    </h3>
    <ul>
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
    </ul>
    {% if category.products_total == 1 %}
    <p>
      <strong>
        {{ '_' | jtext: 'COM_JKASSA_COMPARE_NOT_ENOUGH' }}
      </strong>
    </p>
    {% else %}
    <p>
      <a href="{{ category.url }}" class="button">
        {{ '_' | jtext: 'COM_JKASSA_COMPARE_COMPARE' }}
      </a>
    </p>
    {% endif %}
  </div>
</div>
{% endfor %}
{% endif %}

{% if products %}
  {% if products.products_total == 1 %}
    <div class="alert alert-info alert-block">
      {{ '_' | jtext: 'COM_JKASSA_COMPARE_NOT_ENOUGH' }}
    </div>
  {% else %}
    {% assign width_table = 80 | divided_by: products.products_total %}
    <!--Products-->
    <table id="jkCompare">
      <thead>
        <tr>
          <th width="20%">
            <div class="btn-group">
              <a href="#" data-click="compare-all" class="active" title="{{ '_' | jtext: 'COM_JKASSA_COMPARE_SHOW_ALL_TITLE' }}">{{ '_' | jtext: 'JALL' }}</a> | <a href="#" data-click="compare-diff" class="" title="{{ '_' | jtext: 'COM_JKASSA_COMPARE_SHOW_DIFF_TITLE' }}">{{ '_' | jtext: 'COM_JKASSA_COMPARE_SHOW_DIFF' }}</a>
            </div>
          </th>
          {% for product in products.products %}
          <th width="{{ width_table }}%" style="vertical-align:top">
            <!--Remove from compare-->
            <a href="#" style="float:right" data-click="remove-compare" data-id="{{ product.index }}" title="{{ '_' | jtext: 'COM_JKASSA_COMPARE_DELETE_TITLE' }}">&times;</a>
            <!--Product Image-->
            <div class="text-center">
              <a href="{{ product.url }}" target="_top">
                <img {{ product.image | img_exists: '104x150' }} alt="{{ product.alias }}" />
              </a>
            </div>
            <!--Name and URL of the product-->
            <h4>
              <a href="{{ product.url }}" target="_top">
                {{ product.name }}
              </a>
            </h4>
            <!--Price product-->
            <div class="m-t-10">
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
            <div class="muted m-t-5 text-right">
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
				Rating reviews JKassa or Plug-in voting (See: Plugin Manager: Plugins -> jkvotes).
			{% endcomment %}
			{% if reviews_included %}
			  <!--Rating reviews-->
	  		  <div class="text-right" title="{{ 'plural' | jtext: 'COM_JKASSA_REVIEWS_COUNT', product.rating_count }}">
	    		{% for i in (1..5) %}
				  {% if product.rating >= i %}
				    {{ 'image' | jhtml: 'system/rating_star.png', 'star', '', 1 }}
				  {% else %}
				    {{ 'image' | jhtml: 'system/rating_star_blank.png', 'star_blank', '', 1 }}
				  {% endif %}
				{% endfor %}
	  		  </div>
			{% else %}
              {% assign votes = product.id | jkcountervotes: product.rating, product.rating_count %}
              {% if votes %}
              <!--Voting-->
              <div class="text-right">
                {{ votes }}
              </div>
              {% endif %}
			{% endif %}
            {% if product.variants %}
            <!--Variants product-->
            <div class="m-t-10" id="variant-{{ product.index }}">
              {% for variant in product.variants %}
                {{ variant.name }}: {{ variant.title }}
                <input type="hidden" data-attr-title="{{ variant.title }}" name="variant-{{ product.id }}-{{ variant.id }}" value="{{ variant.value }}">
                <br>
              {% endfor %}
            </div>
            {% endif %}
            <!--Buttons-->
            <div class="text-center m-t-10">
              <!--Add to cart-->
              {% if product.cart_disabled != 'false' %}
              <a href="#" data-click="to-cart-user" data-index="{{ product.index }}" data-id="{{ product.id }}" title="{{ product.cart_title }}">
                {{ '_' | jtext: 'COM_JKASSA_TO_CART' }}
              </a>
              {% endif %}
            </div>
          </th>
          {% endfor %}
        </tr>
      </thead>
      <tbody>
        {% for row in attrib_row %}
        {{ row }}
        {% endfor %}
      </tbody>
    </table>
  {% endif %}

<p class="text-center">
  <a href="{{ link_url }}" class="button">
    &laquo;&laquo; {{ '_' | jtext: 'COM_JKASSA_COMPARE_LIST' }}
  </a>
</p>
{% endif %}

{% if no_compare %}
<!--No products to compare-->
<p>
  <strong>
    {{ '_' | jtext: 'COM_JKASSA_COMPARE_NO_PRODUCTS' }}
  </strong>
</p>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}