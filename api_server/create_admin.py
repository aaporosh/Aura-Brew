import os
import django

# Django environment setup
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'core.settings')
django.setup()

from accounts.models import User

# --- Admin Details ---
phone = '01712345678'  # আপনার ফোন নাম্বার
pin = '1234'          # অবশ্যই ৪টি সংখ্যা হতে হবে (যেমন: ১২৩৪)
full_name = 'Abir'

def create_admin():
    from django.contrib.auth.hashers import make_password
    if not User.objects.filter(phone=phone).exists():
        user = User.objects.create_superuser(phone=phone, full_name=full_name, password='temporary_password')
        user.pin = make_password(pin)
        user.save()
        print(f"Successfully created superuser with PIN: {pin}")
    else:
        user = User.objects.get(phone=phone)
        user.pin = make_password(pin)
        user.save()
        print(f"Updated PIN for existing user {phone} to: {pin}")

if __name__ == "__main__":
    create_admin()
