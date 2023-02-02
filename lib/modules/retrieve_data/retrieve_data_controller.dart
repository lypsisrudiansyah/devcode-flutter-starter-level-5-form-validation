import 'package:devcode_flutter_starter/data/enums/enums.dart';
import 'package:devcode_flutter_starter/data/model/request/create_contact_request.dart';
import 'package:devcode_flutter_starter/data/model/response/contact_model.dart';
import 'package:devcode_flutter_starter/data/repository/contact_repository.dart';
import 'package:devcode_flutter_starter/modules/retrieve_data/widgets/create_edit_result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RetrieveDataController extends GetxController {
  // .obs berarti variabel ini bersifat observable (perubahan data melalui stream)

  // Get contact variable
  final contactStatus = RequestStatus.IDLE.obs;
  final contacts = <ContactItem>[].obs;

  // Create contact variable
  final createContactStatus = RequestStatus.IDLE.obs;
  final fullname = ''.obs;
  final phoneNumber = ''.obs;
  final email = ''.obs;
  final validateInput = false.obs;

  ContactItem? selectedContact;

  // Input controller
  final fullnameController = TextEditingController(), phoneNumberController = TextEditingController(),
        emailController = TextEditingController();

  final contactRepository = ContactRepositoryImpl();

  String? errorInput(String key) {
    // TODO: Uncomment code di bawah untuk menampilkan pesan error berdasarkan ketentuan validasi
    if (!validateInput.value) return null;
    //
    if (key == 'fullname') {
      return fullname.value.isEmpty ? 'Field nama tidak boleh kosong' : null;
    } else if (key == 'phone') {
      return phoneNumber.value.isEmpty ? 'Field nomor telephone tidak boleh kosong' : !phoneNumber.value.isPhoneNumber ? 'Format nomor telepon tidak sesuai' : null;
    } else if (key == 'email') {
      return email.value.isEmpty ? 'Field email tidak boleh kosong' : !email.value.isEmail ? 'Format email tidak sesuai' : null;
    }

    return null;
  }

  void resetInput() {
    fullname('');
    phoneNumber('');
    email('');

    fullnameController.text = '';
    phoneNumberController.text = '';
    emailController.text = '';

    validateInput(false);
  }

  void getContacts() async {
    contactStatus(RequestStatus.LOADING);
    final data = await contactRepository.getContact();
    // Code di bawah ini adalah inline condition atau biasa disebut ternary condition.
    // [.isLeft()] merupakan method bawaaan dari package [dartz] untuk mengetahui status error
    contactStatus(data.isLeft() ? RequestStatus.ERROR : RequestStatus.SUCCESS);

    data.fold((left) {}, (right) => contacts.assignAll(right));
  }

  void createContact() async {
    createContactStatus(RequestStatus.LOADING);
    final data = await contactRepository.createContact(createContactRequest(fullname.value, phoneNumber.value, email.value));
    createContactStatus(data.isLeft() ? RequestStatus.ERROR : RequestStatus.SUCCESS);

    data.fold((left) {
      if (left == 'full_name, phone_number, and email is duplicate') {
        showCreateEditResultDialog('Data yang anda masukkan sudah terdaftar di server!');
      }
    }, (right) {
      showCreateEditResultDialog('Berhasil memasukkan data ke server!');

      contacts.add(right);
    });

    resetInput();
  }

  void editContact() async {
    createContactStatus(RequestStatus.LOADING);
    final data = await contactRepository.editContact(createContactRequest(fullname.value, phoneNumber.value, email.value), selectedContact!);
    createContactStatus(data.isLeft() ? RequestStatus.ERROR : RequestStatus.SUCCESS);

    data.fold((left) {}, (right) {
      final selectedIndex = contacts.indexWhere((element) => element.id == selectedContact?.id);

      contacts[selectedIndex] = right;
      contacts.refresh();

      // Reset [selectedContact] to null
      selectedContact = null;

      showCreateEditResultDialog('Berhasil memperbarui data ke server!');
    });

    resetInput();
  }

  void prepareEditContact(ContactItem contact) {
    selectedContact = contact;

    fullname(contact.fullName);
    phoneNumber(contact.phoneNumber);
    email(contact.email);

    fullnameController.text = fullname.value;
    phoneNumberController.text = phoneNumber.value;
    emailController.text = email.value;
  }

  void deleteContact(ContactItem contact) async {
    final data = await contactRepository.deleteContact(contact);

    data.fold((l) {}, (r) {
      contacts.remove(contact);
      showDeleteDialog();
    });
  }
  
  void showDeleteDialog() {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Data contact berhasil dihapus', key: Key('delete-desc'), style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),),
          const SizedBox(height: 16,),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  key: const Key('btn-ok'),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('OK', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white)),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.red,
                    // minimumSize: Size(double.infinity, minimumSize ?? 50),
                  ),
                ),
              ),
            ],
          )
        ],
      ).paddingAll(16),
    ));
  }

  void showCreateEditResultDialog(String title) async {
    Get.dialog(CreateEditResultDialog(title: title, fullname: fullname.value, phone: phoneNumber.value, email: email.value));
  }

  @override
  void onInit() {
    getContacts();

    super.onInit();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();

    super.dispose();
  }
}