{{ 'stylesheet' | jhtml: 'css/style.css' }}

<div id="jk-cart-module" class="article-info {{ class_sfx }}">
  {% if image %}
    <div class="box text-center" style="min-height: 0px">
      <a href="{{ url_cart }}">
        <img alt="cart" src="{{ image }}" title="{{ image_title }}">
      </a>
    </div>
    <div class="box3 text-center">
      {{ 'plural' | jtext: 'MOD_JKASSA_CART_QUANTITY', quantity }}
      {% if products %}
      - {{ total | costDisplay }}{{ currency.symbol }}
      <br>
      <a href="{{ url_cart }}">
        {{ '_' | jtext: 'MOD_JKASSA_CART_YOUR_CART' }}
      </a>
      {% endif %}
    </div>
  {% else %}
    {{ 'plural' | jtext: 'MOD_JKASSA_CART_QUANTITY', quantity }}
    {% if products %}
    - {{ total | costDisplay }}{{ currency.symbol }}
    <br>
    <a href="{{ url_cart }}">
      {{ '_' | jtext: 'MOD_JKASSA_CART_YOUR_CART' }}
    </a>
    {% endif %}
  {% endif %}
</div>