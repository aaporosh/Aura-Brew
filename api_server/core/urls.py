"""
Root URL configuration for Aura Brew backend.
"""

from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/v1/auth/', include('accounts.urls')),
    path('api/v1/products/', include('products.urls')),
    path('api/v1/orders/', include('orders.urls')),
    path('api/v1/cart/', include('cart.urls')),
    path('api/v1/feedback/', include('feedback.urls')),
    path('api/v1/stores/', include('stores.urls')),
    path('api/v1/banners/', include('banners.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
