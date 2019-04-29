{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}

{% if viewtmpl != 'component' %}
<!--Header-->
{% if heading %}
<h1>{{ heading }} <small>({{ quantity }})</small></h1>
{% else %}
<h2>{{ title }} <small>({{ quantity }})</small></h2>
{% endif %}
{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}
{% endif %}

{% if cart_empty %}
<!--Cart empty-->
<div>
  <h4>{{ '_' | jtext: 'COM_JKASSA_CART_EMPTY_TITLE' }}!</h4>
  <p>
    {% if user_guest %}
    {{ 'sprintf' | jtext: 'COM_JKASSA_CART_EMPTY_NOTE_GUEST', login_url }}
    {% else %}
    {{ '_' | jtext: 'COM_JKASSA_CART_EMPTY_NOTE' }}
    {% endif %}
  </p>
</div>
{% endif %}

{% if products %}
  {% if limit_order %}
  <!--Minimum order amount-->
  <div>
    {% capture limit_cost %}{{ limit_order | costDisplay }}{{ currency.symbol }}{% endcapture %}
    <h4>{{ 'sprintf' | jtext: 'COM_JKASSA_LIMIT_ORDER', limit_cost  }}</h4>
    <p>{{ '_' | jtext: 'COM_JKASSA_LIMIT_ORDER_NOTE' }}</p>
  </div>
  {% endif %}
  
  <table>
    <thead>
      <tr>
        <th></th>
        <th>{{ '_' | jtext: 'COM_JKASSA_GRID_TITLE' }}</th>
        <th class="text-center">{{ '_' | jtext: 'COM_JKASSA_QUANTITY' }}</th>
        <th class="text-center">{{ '_' | jtext: 'COM_JKASSA_COST' }}</th>
      </tr>
    </thead>
    <tbody>
      {% for product in products %}
      <tr>
        <td class="product-image">
          {% if product.d_simple %}
          <ul class="stickers">
            <li>
              <span class="product-label">
                {% assign options = 'decimals' | arrayCombine: 0 %}
                -{{ product.d_simple.value | costDisplay: options }}{% if product.d_simple.symbol == '%' %}{{ product.d_simple.symbol }}{% endif %}
              </span>
            </li>
          </ul>
          {% endif %}
          
          <!--Product Image-->
          <div class="text-center">
            <a href="{{ product.url }}" target="_blank">
              <img {{ product.image | img_exists: '88x127' }} alt="{{ product.alias }}" title="{{ product.name }}" />
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
        </td>
        <td>
          <!--Product Information-->
          <div>
            <h4>
              <a href="{{ product.url }}" target="_blank">
                {{ product.name }}
              </a>
              
              {% if product.files %}
              <!--Files-->
              <span title="{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}: {{ product.files | join: ', ' }}">
                <img alt="info" src="media/system/images/new.png">
              </span>
              {% endif %}
            </h4>
          </div>
          
          {% if product.sku %}
          <!--SKU (code)-->
          <p class="text-right">
            <small>
              {{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ product.sku }}
            </small>
          </p>
          {% endif %}
            
          {% if product.variants %}
          <!--Variants product-->
          <p>
            {% for variant in product.variants %}
              {{ variant.name }}: {{ variant.title }}
            {% endfor %}
          </p>
          {% endif %}
          
          <!--Cost-->
          <p class="cost">
            <!--old cost-->
            {% if product.old_cost %}
            <del>{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
            {% endif %}
            <!--cost-->
            <span>{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
			{% if product.d_coupon %}
			<!--Promotional code-->
			<br>
			<small>
			  <strong>{{ product.d_coupon.name }}</strong>:
			  -{{ product.d_coupon.difference | costDisplay }}{{ currency.symbol }}
			  {% if product.d_coupon.symbol == '%' %}
			  <em>({{ product.d_coupon.value }}%)</em>
			  {% endif %}
			  {% if product.d_coupon.desc %}
			  <img alt="help" src="media/system/images/tooltip.png" title="{{ product.d_coupon.desc }}">
			  {% endif %}
			</small>
			{% endif %}
          </p>
        </td>
        <td class="text-center" width="20%">
          <!--Quantity-->
          <a href="javascript:;" data-click="qty-minus-cart" data-id="{{ product.index }}" class="button" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">&minus;</a>
          <input type="text" value="{{ product.quantity }}" data-id="{{ product.index }}" data-limit="{{ product.limit }}" data-maxlimit="{{ product.maxlimit }}" size="2" class="text-center" name="qty-product-cart-{{ product.index }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_TITLE' }}">
          <a href="javascript:;" data-click="qty-plus-cart" data-id="{{ product.index }}" class="button" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">+</a>
        </td>
        <td class="text-center">
          <!--Price-->
          <p class="cost">
            <span>{{ product.price | costDisplay }}</span>{{ currency.symbol }}
			{% if product.vat %}
			<br>
	        <!--vat-->
	        <small>
		      ({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', product.vat }})
	        </small>
            {% endif %}
          </p>
          <!--Remove from Cart-->
          <p>
            <a href="#" data-click="remove-product" data-index="{{ product.index }}" class="button" title="{{ '_' | jtext: 'COM_JKASSA_CART_DELETE_TITLE' }}">
              {{ '_' | jtext: 'JACTION_DELETE' }}
            </a>
          </p>
        </td>
      </tr>
      {% endfor %}
      
      {% if sum_note %}
      <!--Discount sum note-->
      <tr>
        <td colspan="4">
          {% capture sum_note_amount %}{{ sum_note.amount | costDisplay }}{{ currency.symbol }}{% endcapture %}
          {% capture sum_note_discount %}{{ sum_note.discount | costDisplay }}{{ sum_note.symbol }}{% endcapture %}
          {{ 'sprintf' | jtext: 'COM_JKASSA_CART_DISCOUNTS_SUM_NOTE', sum_note_amount, sum_note_discount }}
        </td>
      </tr>
      {% endif %}
      
      {% if discounts %}
      <!-- Total price -->
      <tr>
        <td colspan="3" class="text-right">
          {{ '_' | jtext: 'COM_JKASSA_SUM' }}:
        </td>
        <td>
          {{ total | costDisplay }}{{ currency.symbol }}
        </td>
      </tr>
      {% endif %}
	  
	  {% if discounts.sav %}
      <!--Discount sav-->
      <tr>
        <td colspan="3" class="text-right">
          {{ discounts.sav.name }}:
        </td>
        <td>
          -{{ discounts.sav.difference | costDisplay }}{{ currency.symbol }}
		  {% if discounts.sav.percent %}
		  <em>({{ discounts.sav.discount }}%)</em>
		  {% endif %}
          {% if discounts.sav.desc %}
          <img alt="info" src="media/system/images/tooltip.png" title="{{ discounts.sav.desc }}">
          {% endif %}
        </td>
      </tr>
      {% endif %}
      
      {% if discounts.sum %}
      <!--Discount sum-->
      <tr>
        <td colspan="3" class="text-right">
          {{ discounts.sum.name }}:
        </td>
        <td>
          -{{ discounts.sum.difference | costDisplay }}{{ currency.symbol }}
		  {% if discounts.sum.percent %}
		  <em>({{ discounts.sum.discount }}%)</em>
		  {% endif %}
          {% if discounts.sum.desc %}
          <img alt="info" src="media/system/images/tooltip.png" title="{{ discounts.sum.desc }}">
          {% endif %}
        </td>
      </tr>
      {% endif %}
	  	  
	  {% if sum_vat %}
	  <!--Sum of VAT-->
	  <tr>
	    <td colspan="3" class="text-right">
          {{ '_' | jtext: 'COM_JKASSA_VAT' }}:
        </td>
        <td>
          {{ sum_vat | costDisplay }}{{ currency.symbol }}
        </td>
	  </tr>
	  {% endif %}
      
      <!--Order url / In total price-->
      <tr>
        <td>
          {% if limit_order == 0 %}
          <button type="button" onClick="window.open('{{ order_url }}', '_top')">
            {{ '_' | jtext: 'COM_JKASSA_CHECKOUT' }}
          </button>
          {% endif %}
        </td>
        <td colspan="2" class="text-right">
          <strong>{{ '_' | jtext: 'COM_JKASSA_TOTAL' }}:</strong>
        </td>
        <td>
          <strong class="cost">
            <span>{{ in_total | costDisplay }}</span>{{ currency.symbol }}
          </strong>
        </td>
      </tr>
      
    </tbody>
  </table>
  
  {% if cheaper %}
  <!--Share: Together cheaper-->
  <div>
    <h3>{{ '_' | jtext: 'COM_JKASSA_CART_TOGETHER_CHEAPER' }}</h3>
    {% include 'html/products/cheaper' %}
  </div>
  {% endif %}
  
  {% if relateds %}
  <!--Related products-->
  <div>
    <h3>{{ '_' | jtext: 'COM_JKASSA_CART_ADD_TO_ORDER' }}</h3>
    {% include 'html/products/relateds' %}
  </div>
  {% endif %}
{% endif %}

{% if viewtmpl != 'component' %}
{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}
<!--Button: 'Continue Shopping'-->
<div class="text-center">
  <a href="{{ home_page }}">
    {{ '_' | jtext: 'COM_JKASSA_CART_CONTINUE_SHOPPING' }}
  </a>
</div>
{% endif %}