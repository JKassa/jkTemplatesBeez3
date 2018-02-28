<table>
  <thead>
    <tr>
      <th></th>
      <th>{{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}</th>
      <th class="text-center">{{ '_' | jtext: 'COM_JKASSA_COST' }}</th>
    </tr>
  </thead>
  <tbody>
    {% for product in products %}
    <tr itemtype="http://schema.org/Product" itemscope>
      <td>
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
              {% assign options = 'decimals' | arrayCombine: 0 %}
              {% if product.discount_image %}
              <img {{ product.discount_image | img_exists: '30x30' }} alt="" title="{{ product.discount_desc }} - {{ product.discount | costDisplay: options }}{{ product.d_symbol }}">
              {% else %}
              <span class="product-label" title="{{ product.discount_desc }} - {{ product.discount | costDisplay: options }}{{ product.d_symbol }}">
                -{{ product.discount | costDisplay: options }}{% if product.d_symbol == '%' %}{{ product.d_symbol }}{% endif %}
              </span>
              {% endif %}
            </li>
            {% endif %}
          </ul>
          {% endif %}
          
          {% if product.manufacturer %}
          <!--Manufacturer name and miniature-->
          <div class="manufacturer" itemtype="http://schema.org/Brand" itemscope itemprop="brand">
            <span style="display: none;" itemprop="name">{{ product.manufacturer.name }}</span>
            <img {{ product.manufacturer.thumbnail | img_exists: '30x30' }} itemprop="logo" alt="{{ product.manufacturer.alias }}" title="{{ product.manufacturer.name }}">
          </div>
          {% endif %}
          
          {% if product.tags %}
          <!-- Tags -->
          <div style="position: absolute; right: 0; bottom: 4px">
            {% for tag in product.tags %}
            <a href="{{ tag.url }}" class="{{ tag.link_class }}" style="float: right; border-radius: 9px 0 0 9px; margin-top: 2px; padding: 0 5px">
              {{ tag.title }}
            </a><br>
            {% endfor %}
          </div>
          {% endif %}
          
          <!--Product Image-->
          <div class="text-center" style="width:150px">
			{% assign jkmedialist = product.image | jkmedialist: product.images, '', '', product.url %}
			{% if jkmedialist %}
	          {{ jkmedialist }}
            {% else %}
            <a href="{{ product.url }}">
              <img {{ product.image | img_exists: '104x150' }} alt="{{ product.alias }}" />
            </a>
			{% endif %}
          </div>
          
          <!--Quick view-->
          <div class="quick-view">
            <a href="{{ product.quick_url }}" class="button jk-quick_view" title="{{ 'sprintf' | jtext: 'COM_JKASSA_QUICK_VIEW_TITLE',  product.name }}" rel="{handler: 'iframe', size: {x:768, y:430}}">
              <span class="icon-zoom-in"></span>
              {{ '_' | jtext: 'COM_JKASSA_QUICK_VIEW' }}
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
      </td>
      <td>
        <!--Name and URL of the product-->
        <h4>
          <a href="{{ product.url }}">
            <span itemprop="name">{{ product.name }}</span>
          </a>
          {% if product.files %}
            <!--Files-->
            <span title="{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}: {{ product.files | join: ', ' }}">
              <img alt="info" src="media/system/images/new.png">
            </span>
          {% endif %}
        </h4>
        
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
        
        <!--SKU (code)-->
        <p class="text-right">
          <small>
            {{ '_' | jtext: 'COM_JKASSA_SKU' }}:
            <span itemprop="mpn">
              {{ product.sku }}
            </span>
          </small>
        </p>
        
        <!--Product Description (introtext)-->
        <p itemprop="description">
          {{ product.introtext | truncateDesc: 140 }}
        </p>
        
        {% comment %}
            Variants product.
            See: html\forms\variants.tpl
        {% endcomment %}
        {% if product.variants %}
          {{ product.variants }}
        {% endif %}
        
        <!--More-->
        <div>
          <a href="{{ product.url }}" class="button" title="{{ 'sprintf' | jtext: 'COM_JKASSA_READ_MORE', product.name }}" itemprop="url">
            {{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}
          </a>
          
          {% comment %}
              Connecting comments plugin.
              See: Plugin Manager: Plugins -> jkcomments.
          {% endcomment %}
          {% capture title_comments %}{{ '_' | jtext: 'COM_JKASSA_COMMENTS' }}: [COUNT]{% endcapture %}
          {% assign count_comments = product.id | jkcountercomments: title_comments, product.url, 'button' %}
          
          {% if count_comments %}
          {{ count_comments }}
          {% endif %}
        </div>
      </td>
      <td class="text-center" style="min-width: 120px;">
        <!--Price the product-->
        <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
          <!--old cost-->
          {% if product.old_cost %}
          <del>{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
          {% endif %}
          
          <!--cost-->
          <span class="cost">
            <meta itemprop="priceCurrency" content="{{ currency.code }}" />
            {% assign options = 'dec_point,thousands_sep' | arrayCombine: '.', '*' %}
            <span itemprop="price" content="{{ product.cost | costDisplay: options }}">{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
          </span>
          
          {% if product.discount %}
          <br>
          <!--discount-->
          <small>
            {{ '_' | jtext: 'COM_JKASSA_DISCOUNT' }}:
            {{ product.discount | costDisplay }}{{ product.d_symbol }}
          </small>
          {% endif %}
		  
		  {% if product.vat %}
		  <br>
		  <!--vat-->
	  	  <small>
		    ({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', product.vat }})
	 	  </small>
      	  {% endif %}
        </div>
        
        <!--Stock-->
        <p>
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
        </p>
        
        <!--Buttons-->
        <div>
          {% if product.cart_disabled != 'false' %}
          <!--Quantity-->
          <a href="javascript:;" data-click="qty-minus" data-id="{{ product.id }}" class="button" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">&minus;</a>
          <input type="text" value="{{ product.limit }}" data-limit="{{ product.limit }}" data-maxlimit="{{ product.maxlimit }}" size="2" name="qty-product-{{ product.id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_TITLE' }}" class="text-center">
          <a href="javascript:;" data-click="qty-plus" data-id="{{ product.id }}" class="button" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">+</a>
          {% endif %}
          
          {% if product.cart_disabled != 'false' %}
          <!--Add to cart-->
          <p>
            <a href="#" data-click="to-cart" data-id="{{ product.id }}" class="button" title="{{ product.cart_title }}">
              {{ '_' | jtext: 'COM_JKASSA_TO_CART' }}
            </a>
          </p>
          {% endif %}
          
          <p>
            <!--Add to Wish List-->
            <a href="#" data-click="to-wishlist" data-id="{{ product.id }}" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_WISHLIST_TITLE', product.name }}">
              {{ '_' | jtext: 'COM_JKASSA_TO_WISHLIST' }}
            </a>
            <br>
            <!--Add to compare-->
            <a href="#" data-click="to-compare" data-id="{{ product.id }}" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ADD_TITLE', product.name}}">
              {{ '_' | jtext: 'COM_JKASSA_COMPARE_ADD' }}
            </a>
          </p>
        </div>
      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>