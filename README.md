# Sorcery Sample
����͈ȉ��̏����ō��ꂽRails�v���O�����ł��B

- has_many through�ő��Α��̃����[�V�������g��
- sorcery ([https://github.com/NoamB/sorcery](https://github.com/NoamB/sorcery "sorcery ")) ���g���F�؋@�\����������
- Twitter Bootstrap ���g��
- RSpe ���g�����e�X�g
- Ruby 2.0 �ȏ�
- Rails 3 �܂��� Rails 4

�ȏ�̋@�\�̎����ɋ���������ɂ́A����ΎQ�l�ɂȂ邩������܂���(�Ȃ�Ȃ������炷���܂���)

���ARails�́A4.2.7�ARuby�́A2.2.5p319(Ruby 2.3.0�ȍ~���g����sqlite�Abcrypt���G���[���N������ *2016/07/30����)�̊��ō쐬���܂����B

## Docker�Ή�
Dockerfile��ǉ����܂����B
Docker���C���X�g�[������Ă�����ł���΁A�ȉ��̃R�}���h�̎��s�ŋN�����Ahttp://localhost:3000/ �ŃA�N�Z�X�ł��܂��B�i-t�Ŏw�肷��^�O�͂Ȃ�ł��\���܂���j
```bash
$ docker build -t steiley/ss .
$ docker run -p 3000:3000 steiley/ss
```