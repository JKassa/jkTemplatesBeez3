{{ 'stylesheet' | jhtml: 'css/style.css' }}

{% if image %}
  {% assign cols = 3 %}
  {% assign column_img = 1 %}
  {% assign column_prod = 2 %}
  {% assign column_info = 3 %}
{% else %}
  {% assign cols = 2 %}
  {% assign column_prod = 1 %}
  {% assign column_info = 2 %}
{% endif %}

<div id="jk-cart-module" class="article-info {{ class_sfx }}">
  <ul class="items-row cols-{{ cols }}">
    {% if image %}
    <li class="item column-{{ column_img }} text-center">
      <a href="{{ url_cart }}">
        <img alt="cart" src="{{ image }}" title="{{ image_title }}">
      </a>
    </li>
    {% endif %}
    <li class="item column-{{ column_prod }}">
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
      {% else %}
      <!--Text empty cart-->
      <p>
        {{ text_empty }}
      </p>
      {% endif %}
    </li>
    <li class="item column-{{ column_info }}">
      <!--Quantity-->
      <p class="text-center">
        {% capture cart_quantity %}<strong>{{ quantity }}</strong>{% endcapture %}
        {{ 'sprintf' | jtext: 'MOD_JKASSA_CART_COUNT', cart_quantity }}
      </p>
      
      {% if products %}
      <!--Cart total-->
      <p class="text-center">
        {% capture cart_total %}<strong>{{ total | costDisplay }}{{ currency.symbol }}</strong>{% endcapture %}
        {{ 'sprintf' | jtext: 'MOD_JKASSA_CART_AMOUNT', cart_total }}
      </p>
      
      <!--URL cart-->
      <p class="text-center">
        <a href="{{ url_cart }}">
          {{ '_' | jtext: 'MOD_JKASSA_CART_YOUR_CART' }}
        </a>
      </p>
      <!--URL order-->
      <p class="text-center">
        <a href="{{ url_order }}" class="button">
          {{ '_' | jtext: 'MOD_JKASSA_CART_CART_ORDER' }}
        </a>
      </p>
      {% endif %}
    </li>
  </ul>
</div>