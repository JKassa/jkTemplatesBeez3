<table style="margin-top: 1.5em;">
  <thead>
    <tr>
      <!--ID/Code-->
      <th width="1%" class="text-center">
        {{ '_' | jtext: 'COM_JKASSA_ID_SKU' }}
      </th>
      <!--Name-->
      <th>
        {{ '_' | jtext: 'COM_JKASSA_GRID_TITLE' }}
      </th>
      <!--Price (per 1 unit)-->
      <th class="text-center">
        {{ '_' | jtext: 'COM_JKASSA_PRICE_1' }}
      </th>
      <!--Count-->
      <th width="1%">
        {{ '_' | jtext: 'COM_JKASSA_QUANTITY' }}
      </th>
      <!--Price-->
      <th class="text-center">
        {{ '_' | jtext: 'COM_JKASSA_COST' }}
      </th>
    </tr>
  </thead>
  <tbody>
    {% for product in products %}
    <tr>
      <!--ID/Code-->
      <td class="text-center">
        <small>
          {{ product.id }}
          {% if product.id != product.sku %}
            <br />
            {{ product.sku }}
          {% endif %}
        </small>
      </td>
      <!--Name-->
      <td>
        {% if product.image %}
        <div style="float: left; margin-right: 5px;">
          <img {{ product.image | img_exists: '80x80' }} alt="{{ product.alias }}" style="max-height: 80px; max-width: 80px;" />
        </div>
        {% endif %}
        
        <a href="{{ product.url }}" target="_blank" title="{{ '_' | jtext: 'COM_JKASSA_SHOW_SHOP' }}">
          {{ product.name }}
        </a>
        
        {% if product.present %}
        + <a href="{{ product.present.url }}">{{ product.present.name }}</a>
        {% endif %}
        
        {% if product.variants %}
        <div>
          {% for variant in product.variants %}
            {{ variant.name }}: {{ variant.title }}
          {% endfor %}
        </div>
        {% endif %}
		
		{% if product.d_simple %}
        <!--Discount-->
        <br>
        <small>
          {{ product.d_simple.name }}:
          -{{ product.d_simple.difference | costDisplay }}{{ currency.symbol }}
          {% if product.d_simple.symbol == '%' %}
          <em>({{ product.d_simple.value }}%)</em>
          {% endif %}
        </small>
        {% endif %}
        {% if product.d_coupon %}
        <!--Promotional code-->
        <br>
        <small>
          {{ product.d_coupon.name }}:
          -{{ product.d_coupon.difference | costDisplay }}{{ currency.symbol }}
          {% if product.d_coupon.symbol == '%' %}
          <em>({{ product.d_coupon.value }}%)</em>
          {% endif %}
        </small>
        {% endif %}
        
        {% if product.attachment %}
        <fieldset style="padding: 0 10px 10px;">
          <legend>
            {{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}
          </legend>
          <ul style="margin-bottom: 0;">
            {% for file in product.attachment %}
            <li>
              <a href="javascript:;" onClick="{{ file.url }}" title="{{ '_' | jtext: 'COM_JKASSA_FILE_DOWNLOAD' }}">
                {{ file.name }}
              </a>
            </li>
            {% endfor %}
          </ul>
        </fieldset>
        {% endif %}
      </td>
      <!--Price (per 1 unit)-->
      <td class="text-center">
		{% if product.old_cost %}
        <!--Old cost-->
        <del>{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del><br>
        {% endif %}
        {{ product.cost | costDisplay }}{{ currency.symbol }}
      </td>
      <!--Count-->
      <td class="text-center">
        {{ product.quantity }}
      </td>
      <!--Price-->
      <td class="text-center">
        {{ product.price | costDisplay }}{{ currency.symbol }}
		{% if product.vat %}
		<br>
	    <!--vat-->
	    <small>
		  ({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', product.vat }})
	    </small>
        {% endif %}
      </td>
    </tr>
    {% endfor %}
    
    <!--Cost of products-->
    <tr>
      <td colspan="3" class="text-right">
        {{ '_' | jtext: 'COM_JKASSA_COST_PRODUCTS' }}:
      </td>
      <td colspan="2">
        {{ pm_total | costDisplay }}{{ currency.symbol }}
      </td>
    </tr>
    
    {% if discounts %}
    <!--Discounts data-->
    {% for discount in discounts %}
    <tr>
      <td colspan="3" class="text-right">
      {{ discount.name }}{% if discount.percent %}({{ discount.discount }}){% endif %}:
      </td>
      <td colspan="2">
        -{{ discount.difference | costDisplay }}{{ currency.symbol }}
      </td>
    </tr>
    {% endfor %}
    {% endif %}
    
    {% if delivery %}
    <!--Cost of delivery-->
    <tr>
      <td colspan="3" class="text-right">
        {{ '_' | jtext: 'COM_JKASSA_DELIVERY_CHARGES' }}:
      </td>
      <td colspan="2">
        {{ delivery.cost | costDisplay }}{{ currency.symbol }}
      </td>
    </tr>
    {% endif %}
	
	{% if sum_vat %}
	<!--Sum of VAT-->
	<tr>
	  <td colspan="3" class="text-right">
        {{ '_' | jtext: 'COM_JKASSA_VAT' }}:
      </td>
      <td colspan="2">
        {{ sum_vat | costDisplay }}{{ currency.symbol }}
      </td>
	</tr>
	{% endif %}
	
	{% if taxes %}
	<!--Taxes-->
	{% for tax in taxes %}
	<tr>
	  <td colspan="3" class="text-right">
        {{ tax.name }}:
      </td>
      <td colspan="2">
        {{ tax.tax }}%
      </td>
	</tr>
	{% endfor %}
	{% endif %}
    
    <!--Total-->
    <tr style="font-weight: bold;">
      <td colspan="3" class="text-right">
        {{ '_' | jtext: 'COM_JKASSA_TOTAL' }}:
      </td>
      <td colspan="2">
        {{ pm_in_total | costDisplay }}{{ currency.symbol }}
      </td>
    </tr>
  </tbody>
</table>