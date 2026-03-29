import os
import django

# Django environment setup
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'core.settings')
django.setup()

from accounts.models import User

# --- Admin Details ---
phone = '01712345678'  # আপানর ফোন নাম্বার (ইউজারনেম হিসেবে কাজ করবে)
password = 'abir' # পিন/পাসওয়ার্ড
full_name = 'Abir'

def create_admin():
    if not User.objects.filter(phone=phone).exists():
        User.objects.create_superuser(phone=phone, full_name=full_name, password=password)
        print(f"Successfully created superuser: {phone}")
    else:
        print(f"User {phone} already exists.")

if __name__ == "__main__":
    create_admin()
