<!--In total price-->
<div class="article-info cost">
  <p>
    <!-- Total price -->
	{{ '_' | jtext: 'COM_JKASSA_SUM' }}: <span>{{ total | costDisplay }}</span>{{ currency.symbol }}
	{% if discounts.sav %}
	<br>
	<!--Discounts sav-->
	{{ discounts.sav.name }}: <span>-{{ discounts.sav.difference | costDisplay }}</span>{{ currency.symbol }}
	{% if discounts.sav.percent %}
	<em>({{ discounts.sav.discount }}%)</em>
	{% endif %}
    {% if discounts.sav.desc %}
    <img alt="info" src="media/system/images/tooltip.png" title="{{ discounts.sav.desc }}">
    {% endif %}
	{% endif %}
	{% if discounts.sum %}
	<br>
	<!--Discounts sum-->
	{{ discounts.sum.name }}: <span>-{{ discounts.sum.difference | costDisplay }}</span>{{ currency.symbol }}
	{% if discounts.sum.percent %}
	<em>({{ discounts.sum.discount }}%)</em>
	{% endif %}
    {% if discounts.sum.desc %}
    <img alt="info" src="media/system/images/tooltip.png" title="{{ discounts.sum.desc }}">
    {% endif %}
	{% endif %}
	{% if discounts.code %}
	<br>
	<!--Discounts code-->
	{{ discounts.code.name }}: <span>-{{ discounts.code.difference }}</span>{{ currency.symbol }}
	{% if discounts.code.percent %}
    <em>({{ discounts.code.discount }}%)</em>
    {% endif %}
    {% if discounts.code.desc %}
    <img alt="info" src="media/system/images/tooltip.png" title="{{ discounts.code.desc }}">
    {% endif %}
	{% endif %}
	{% if delivery_cost %}
	<br>
	<!--Delivery cost-->
	{{ '_' | jtext: 'COM_JKASSA_ORDER_DELIVERY' }}:
	{% if delivery_cost == '0.00' %}
      {{ '_' | jtext: 'COM_JKASSA_FREE' }}
    {% else %}
	  <span>{{ delivery_cost | costDisplay }}</span>{{ currency.symbol }}
    {% endif %}
	{% endif %}
	{% if sum_vat %}
	<!--Sum of VAT-->
	<br>
	{{ '_' | jtext: 'COM_JKASSA_VAT' }}: <span>{{ sum_vat }}</span>{{ currency.symbol }}
	{% endif %}
	{% if taxes %}
	<!--Taxes-->
	{% for tax in taxes %}
	<br>
	{{ tax.name }}: <span>{{ tax.tax }}</span>%
	{% endfor %}
	{% endif %}
	<br>
	<!--In total price-->
	{{ '_' | jtext: 'COM_JKASSA_TOTAL' }}:
    <span>{{ in_total | costDisplay }}</span>{{ currency.symbol }}
  </p>
  {% if coupon %}
  <!--Coupons code-->
  <div>
    <input type="text" id="coupons_code" placeholder="{{ '_' | jtext: 'COM_JKASSA_ORDER_CODE_ENTER' }}" value="{{ coupon.value }}">
    <button data-click="code-apply" type="button">{{ '_' | jtext: 'COM_JKASSA_APPLY' }}</button>
	<button data-click="code-clear" type="button">{{ '_' | jtext: 'JCLEAR' }}</button>
    {% if coupon.note %}
    <p>
      {{ coupon.note }}
    </p>
    {% endif %}
  </div>
  {% endif %}
</div>