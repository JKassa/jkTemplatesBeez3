<div class="block-products">
  <ul class="items-row cols-3">
    {% assign rowcount = 0 %}
    {% for product in products %}
      {% assign rowcount = rowcount | plus: 1 %}
      <li class="item column-{{ rowcount }}" itemscope itemtype="http://schema.org/Product">
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
            <div class="text-center">
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
          <div class="caption">
            <!--Name and URL of the product-->
            <h4>
              <a href="{{ product.url }}" title="{{ product.name }}">
                <span itemprop="name">{{ product.name }}</span>
              </a>
              
              {% if product.files %}
                <!--Files-->
                <span title="{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}: {{ product.files | join: ', ' }}">
                  <img alt="info" src="media/system/images/new.png">
                </span>
              {% endif %}
            </h4>
            
            <!--Price the product-->
            <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
              {% if product.old_cost %}
              <!--old cost-->
              <del>{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
              {% endif %}
              <!--cost-->
              <span class="cost">
                <meta itemprop="priceCurrency" content="{{ currency.code }}" />
                {% assign options = 'dec_point,thousands_sep' | arrayCombine: '.', '*' %}
                <span itemprop="price" content="{{ product.cost | costDisplay: options }}">{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
              </span>
			  {% if product.vat %}
	  		  <span class="muted small">
				({{ '_' | jtext: 'COM_JKASSA_VAT_WITH' }})
	 		  </span>
      		  {% endif %}
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
            
            <!--Buttons-->
            <div class="text-center">
              {% if product.cart_disabled != 'false' %}
              <!--Quantity-->
              <div class="text-center">
                <a href="javascript:;" data-click="qty-minus" data-id="{{ product.id }}" class="button" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">&minus;</a>
                <input type="text" value="{{ product.limit }}" data-limit="{{ product.limit }}" data-maxlimit="{{ product.maxlimit }}" size="2" name="qty-product-{{ product.id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_TITLE' }}" class="text-center">
                <a href="javascript:;" data-click="qty-plus" data-id="{{ product.id }}" class="button" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">+</a>
              </div>
              {% endif %}
              
              <!--More-->
              <a href="{{ product.url }}" class="button" title="{{ 'sprintf' | jtext: 'COM_JKASSA_READ_MORE', product.name }}" itemprop="url">
                {{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}
              </a>
              <!--Add to cart-->
              {% if product.cart_disabled != 'false' %}
              <a href="#" data-click="to-cart" data-id="{{ product.id }}" class="button" title="{{ product.cart_title }}">
                {{ '_' | jtext: 'COM_JKASSA_TO_CART' }}
              </a>
              {% endif %}
            </div>
			
			<!--Product Description (introtext)-->
			<span itemprop="description" style="display: none">
			  {{ product.introtext | truncateDesc: 140 }}
			</span>
          </div>
        </div>
      </li>
      {% if rowcount == 3 %}{% assign rowcount = 0 %}{% endif %}
    {% endfor %}
  </ul>
  {% if moreProducts %}
  <!--More products-->
  <div class="text-center">
    <a href="#" data-click="more-products" data-more="{{ moreProducts }}" data-limit="{{ selectedLimit }}" class="button">
      {{ 'plural' | jtext: 'COM_JKASSA_MORE_PRODUCTS', moreProducts }}
    </a>
  </div>
  {% endif %}
</div>